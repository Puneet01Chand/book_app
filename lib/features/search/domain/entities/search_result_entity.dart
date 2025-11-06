import 'package:new_project/features/search/domain/entities/book_entity.dart';

class SearchResultEntity {
  final List<BookEntity> books;
  final int totalItems;

  SearchResultEntity({
    required this.books,
    required this.totalItems,
  });
}