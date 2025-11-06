import 'package:new_project/features/search/data/models/book_model.dart';
import 'package:new_project/features/search/domain/entities/book_entity.dart';

class SearchResultModel {
  final List<BookModel> books;
  final int totalItems;

  SearchResultModel({
    required this.books,
    required this.totalItems,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    final items = json['items'] as List<dynamic>? ?? [];
    final books = items
        .map((item) => BookModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return SearchResultModel(
      books: books,
      totalItems: json['totalItems'] as int? ?? 0,
    );
  }

  SearchResultEntity toEntity() {
    return SearchResultEntity(
      books: books.map((book) => book.toEntity()).toList(),
      totalItems: totalItems,
    );
  }
}
