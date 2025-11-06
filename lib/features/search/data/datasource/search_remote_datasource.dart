import 'package:dartz/dartz.dart';
import 'package:new_project/base/errors/failures.dart';
import 'package:new_project/base/network/api_request.dart';
import 'package:new_project/base/network/dio_client.dart';
import 'package:new_project/features/search/data/models/search_book_request_model.dart';
import 'package:new_project/features/search/data/models/search_result_model.dart';

class SearchRemoteDataSource {
  Future<Either<Failure, SearchResultModel>> searchBooks({
    required SearchBooksRequest request,
  }) async {
    final response = await ApiClient.get(
      apiRequest: ApiRequest(
        url: "https://www.googleapis.com/books/v1/volumes",
        requestType: RequestType.get,
        body: request.toQueryParams(),
      ),
    );

    return response.fold(
          (failure) => Left(failure),
          (json) => Right(SearchResultModel.fromJson(json)),
    );
  }
}

