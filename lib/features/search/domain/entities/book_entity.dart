class BookEntity {
  final String id;
  final String title;
  final List<String> authors;
  final String? thumbnail;
  final String? description;
  final String? publisher;
  final String? publishedDate;
  final int? pageCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.authors,
    this.thumbnail,
    this.description,
    this.publisher,
    this.publishedDate,
    this.pageCount,
  });
}

class SearchResultEntity {
  final List<BookEntity> books;
  final int totalItems;

  SearchResultEntity({
    required this.books,
    required this.totalItems,
  });
}