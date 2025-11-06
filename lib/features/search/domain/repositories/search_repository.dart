import 'package:dartz/dartz.dart';
import 'package:new_project/base/errors/failures.dart';
import 'package:new_project/features/search/data/models/search_book_request_model.dart';
import 'package:new_project/features/search/domain/entities/book_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchResultEntity>> searchBooks({
    required SearchBooksRequest request,
  });
}