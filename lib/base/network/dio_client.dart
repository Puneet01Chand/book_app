import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_project/base/errors/app_exceptions.dart';
import 'package:new_project/base/errors/failures.dart';
import 'package:new_project/base/network/api_request.dart';

class ApiClient {
  static final Dio _dio = Dio()
    ..options.followRedirects = false
    ..options.connectTimeout = const Duration(seconds: 20)
    ..interceptors.clear()
    ..interceptors.add(AppExceptions());

  // ✅ GET
  static Future<Either<Failure, dynamic>> get({required ApiRequest apiRequest}) async {
    try {
      final headers = await _prepareHeaders();
      final response = await _dio.get(
        apiRequest.url,
        queryParameters: apiRequest.body,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ✅ POST
  static Future<Either<Failure, dynamic>> post({required ApiRequest apiRequest}) async {
    try {
      final headers = await _prepareHeaders();
      final data = await _prepareData(apiRequest.bodyType, apiRequest.body);
      final response = await _dio.post(
        apiRequest.url,
        data: data,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ✅ PUT
  static Future<Either<Failure, dynamic>> put({required ApiRequest apiRequest}) async {
    try {
      final headers = await _prepareHeaders();
      final data = await _prepareData(apiRequest.bodyType, apiRequest.body);
      final response = await _dio.put(
        apiRequest.url,
        data: data,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ✅ DELETE
  static Future<Either<Failure, dynamic>> delete({required ApiRequest apiRequest}) async {
    try {
      final headers = await _prepareHeaders();
      final response = await _dio.delete(
        apiRequest.url,
        data: apiRequest.body,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ✅ PATCH
  static Future<Either<Failure, dynamic>> patch({required ApiRequest apiRequest}) async {
    try {
      final headers = await _prepareHeaders();
      final data = await _prepareData(apiRequest.bodyType, apiRequest.body);
      final response = await _dio.patch(
        apiRequest.url,
        data: data,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ✅ Upload Image video- media to signed URL
  static Future<Either<Failure, bool>> uploadToSignedUrl({
    required String? filePath,
    required String? uploadUrl,
    void Function(int sentBytes, int totalBytes)? onProgress,
  }) async {
    try {
      if (filePath == null || filePath.isEmpty) {
        return Left(ValidationFailure("File path cannot be null or empty"));
      }

      final file = File(filePath);

      if (!await file.exists()) {
        return Left(ValidationFailure("File does not exist at path: $filePath"));
      }

      final mimeType = _getMimeTypeFromPath(filePath);
      final bytes = await file.readAsBytes();
      final response = await _dio.put(
        uploadUrl ?? '',
        data: bytes, // 🔁 Stream without converting to bytes
        options: Options(
          headers: {'Content-Type': mimeType},
          responseType: ResponseType.plain, // Prevents Dio from trying to decode
        ),
        onSendProgress: onProgress,
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            "Upload failed: ${response.statusCode} ${response.statusMessage}",
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  static Future<Either<Failure, bool>> uploadToSignedUrlMultipart({
    required String? filePath,
    required String? uploadUrl,
    void Function(int sentBytes, int totalBytes)? onProgress,
  }) async {
    try {
      if (filePath == null || filePath.isEmpty) {
        return Left(ValidationFailure("File path cannot be null or empty"));
      }
      if (uploadUrl == null || uploadUrl.isEmpty) {
        return Left(ValidationFailure("Upload URL cannot be null or empty"));
      }
      final file = File(filePath);
      if (!await file.exists()) {
        return Left(ValidationFailure("File does not exist at path: $filePath"));
      }
      final mimeType = _getMimeTypeFromPath(filePath);
      final fileLength = await file.length();

      print('📤 Starting upload - Size: ${fileLength / (1024 * 1024)} MB');

      // Track progress manually
      int bytesRead = 0;
      final stream = file.openRead().map((chunk) {
        bytesRead += chunk.length;
        onProgress?.call(bytesRead, fileLength);
        print('Progress: ${(bytesRead / fileLength * 100).toStringAsFixed(1)}%');
        return chunk;
      });

      final response = await _dio.put(
        uploadUrl,
        data: stream,
        options: Options(
          contentType: mimeType,
          headers: {
            'Content-Length': fileLength,
          },
          responseType: ResponseType.plain,
        ),
      );

      print('✅ Upload complete: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            "Upload failed: ${response.statusCode}",
            statusCode: response.statusCode,
          ),
        );
      }
    } on DioException catch (e) {
      print('❌ DioException: ${e.type} - ${e.message}');
      if (e.response != null) {
        print('Response: ${e.response?.statusCode} - ${e.response?.data}');
      }
      return Left(_handleError(e));
    } catch (e, stackTrace) {
      print('❌ Error: $e');
      print('StackTrace: $stackTrace');
      return Left(ServerFailure('Upload error: $e'));
    }
  }

  // ✅ Upload Image video- media to signed URL
  static Future<Either<Failure, bool>> uploadProfileToSignedUrl({
    required String? filePath,
    required String? uploadUrl,
    void Function(int sentBytes, int totalBytes)? onProgress,
  }) async {
    try {
      if (filePath == null || filePath.isEmpty) {
        return Left(ValidationFailure("File path cannot be null or empty"));
      }

      final file = File(filePath);

      if (!await file.exists()) {
        return Left(ValidationFailure("File does not exist at path: $filePath"));
      }

      final mimeType = _getMimeTypeFromProfilePath(filePath);
      final bytes = await file.readAsBytes();
      final response = await _dio.put(
        uploadUrl ?? '',
        data: bytes, // 🔁 Stream without converting to bytes
        options: Options(
          headers: {'Content-Type': mimeType},
          responseType: ResponseType.plain, // Prevents Dio from trying to decode
        ),
        onSendProgress: onProgress,
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            "Upload failed: ${response.statusCode} ${response.statusMessage}",
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  // ✅ Header setup
  static Future<Map<String, String>> _prepareHeaders() async {
    final token = "";
    return {'Accept': 'application/json', if (token.isNotEmpty) 'Authorization': 'Bearer $token'};
  }

  // ✅ Prepare data
  static Future<dynamic> _prepareData(BodyType type, dynamic body) async {
    switch (type) {
      case BodyType.raw:
        return body;
      case BodyType.json:
        return body;
      case BodyType.multipart:
      case BodyType.formData:
        return FormData.fromMap(body);
    }
  }

  // ✅ Error handler - Enhanced with specific failure types
  static Failure _handleError(Object e) {
    if (e is DioException) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;

      // Extract error message from various possible response formats
      String errorMessage = 'Unknown error occurred';

      if (responseData != null) {
        if (responseData is Map<String, dynamic>) {
          // Handle different error response formats
          if (responseData['message'] != null) {
            errorMessage = responseData['message'].toString();
          } else if (responseData['detail'] != null) {
            errorMessage = responseData['detail'].toString();
          } else if (responseData['error'] != null) {
            errorMessage = responseData['error'].toString();
          } else if (responseData['errors'] != null) {
            // Handle errors as List or String
            final errors = responseData['errors'];
            if (errors is List) {
              errorMessage = errors.join(', ');
            } else {
              errorMessage = errors.toString();
            }
          } else {
            errorMessage = 'Server error occurred';
          }
        } else if (responseData is String) {
          errorMessage = responseData;
        } else {
          errorMessage = responseData.toString();
        }
      } else {
        errorMessage = e.message ?? 'Network error occurred';
      }

      // Return specific failure types based on status code
      switch (statusCode) {
        case 400:
          return ValidationFailure(errorMessage);
        case 401:
          return AuthenticationFailure();
        case 403:
          return AuthorizationFailure();
        case 404:
          return NotFoundFailure(errorMessage);
        case 408:
        case null when e.type == DioExceptionType.connectionTimeout:
        case null when e.type == DioExceptionType.receiveTimeout:
        case null when e.type == DioExceptionType.sendTimeout:
          return TimeoutFailure();
        case null when e.type == DioExceptionType.connectionError:
          return NetworkFailure();
        default:
          return ServerFailure(errorMessage, statusCode: statusCode);
      }
    }

    if (e is SocketException) {
      return NetworkFailure();
    }

    return UnknownFailure(e.toString());
  }

  static String _getMimeTypeFromPath(String path) {
    final extension = path.split('.').last.toLowerCase();

    const mimeTypes = {
      // Images
      'jpg': 'image/jpg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'bmp': 'image/bmp',
      'webp': 'image/webp',
      'heic': 'image/heic',

      // Video
      'mp4': 'video/mp4',
      'mov': 'video/quicktime',
      'avi': 'video/x-msvideo',
      'mkv': 'video/x-matroska',
      'webm': 'video/webm',

      // Audio
      'mp3': 'audio/mpeg',
      'wav': 'audio/wav',
      'aac': 'audio/aac',
      'ogg': 'audio/ogg',
      'm4a': 'audio/mp4',

      // Documents
      'pdf': 'application/pdf',
      'txt': 'text/plain',
      'csv': 'text/csv',
      'json': 'application/json',
      'xml': 'application/xml',
      'html': 'text/html',
      'htm': 'text/html',

      // Microsoft Office
      'doc': 'application/msword',
      'docx': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'xls': 'application/vnd.ms-excel',
      'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'ppt': 'application/vnd.ms-powerpoint',
      'pptx': 'application/vnd.openxmlformats-officedocument.presentationml.presentation',

      // Others
      'zip': 'application/zip',
      'rar': 'application/x-rar-compressed',
      '7z': 'application/x-7z-compressed',
      'apk': 'application/vnd.android.package-archive',
      'exe': 'application/octet-stream',
      'tar': 'application/x-tar',
      'gz': 'application/gzip',
    };

    return mimeTypes[extension] ?? 'application/octet-stream'; // default fallback
  }

  static String _getMimeTypeFromProfilePath(String path) {
    final extension = path.split('.').last.toLowerCase();

    const mimeTypes = {
      // Images
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'bmp': 'image/bmp',
      'webp': 'image/webp',
      'heic': 'image/heic',

      // Video
      'mp4': 'video/mp4',
      'mov': 'video/quicktime',
      'avi': 'video/x-msvideo',
      'mkv': 'video/x-matroska',
      'webm': 'video/webm',

      // Audio
      'mp3': 'audio/mpeg',
      'wav': 'audio/wav',
      'aac': 'audio/aac',
      'ogg': 'audio/ogg',
      'm4a': 'audio/mp4',

      // Documents
      'pdf': 'application/pdf',
      'txt': 'text/plain',
      'csv': 'text/csv',
      'json': 'application/json',
      'xml': 'application/xml',
      'html': 'text/html',
      'htm': 'text/html',

      // Microsoft Office
      'doc': 'application/msword',
      'docx': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'xls': 'application/vnd.ms-excel',
      'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'ppt': 'application/vnd.ms-powerpoint',
      'pptx': 'application/vnd.openxmlformats-officedocument.presentationml.presentation',

      // Others
      'zip': 'application/zip',
      'rar': 'application/x-rar-compressed',
      '7z': 'application/x-7z-compressed',
      'apk': 'application/vnd.android.package-archive',
      'exe': 'application/octet-stream',
      'tar': 'application/x-tar',
      'gz': 'application/gzip',
    };

    return mimeTypes[extension] ?? 'application/octet-stream'; // default fallback
  }
}
