enum RequestType { post, get, delete, put, patch }

enum BodyType { formData, raw, json, multipart }

class ApiRequest {
  ApiRequest({
    required this.url,
    this.headers,
    required this.requestType,
    this.body,
    this.bodyType = BodyType.raw, // Default to formData
  });
  final String url;
  final RequestType requestType;
  final Map<String, dynamic>? headers;
  final dynamic body;
  final BodyType bodyType;

}
