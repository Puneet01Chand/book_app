import 'package:dartz/dartz.dart';
import 'package:new_project/base/errors/failures.dart';
import 'package:new_project/features/search/data/datasource/search_remote_datasource.dart';
import 'package:new_project/features/search/data/models/search_book_request_model.dart';
import 'package:new_project/features/search/domain/entities/book_entity.dart';

import '../../domain/repositories/search_repository.dart';
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, SearchResultEntity>> searchBooks({
    required SearchBooksRequest request,
  }) async {
    final result = await dataSource.searchBooks(request: request);

    return result.fold(
          (failure) => Left(failure),
          (model) => Right(model.toEntity()),
    );
  }
}