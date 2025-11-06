import 'package:dartz/dartz.dart';
import 'package:new_project/base/errors/failures.dart';
import 'package:new_project/features/search/data/models/search_book_request_model.dart';
import 'package:new_project/features/search/domain/entities/book_entity.dart';
import 'package:new_project/features/search/domain/repositories/search_repository.dart';

class SearchBooksUseCase {
  final SearchRepository repository;

  SearchBooksUseCase(this.repository);

  Future<Either<Failure, SearchResultEntity>> call({
    required SearchBooksRequest request,
  }) {
    return repository.searchBooks(request: request);
  }
}