import '../../domain/entities/book_entity.dart';

class BookModel {
  final String id;
  final String title;
  final List<String> authors;
  final String? thumbnail;
  final String? description;
  final String? publisher;
  final String? publishedDate;
  final int? pageCount;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    this.thumbnail,
    this.description,
    this.publisher,
    this.publishedDate,
    this.pageCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>? ?? {};

    // Safely extract authors
    List<String> authors = [];
    if (volumeInfo['authors'] != null && volumeInfo['authors'] is List) {
      authors = (volumeInfo['authors'] as List)
          .map((author) => author.toString())
          .toList();
    }

    // Safely extract thumbnail
    String? thumbnail;
    if (volumeInfo['imageLinks'] != null && volumeInfo['imageLinks'] is Map) {
      final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>;
      thumbnail = imageLinks['thumbnail'] as String? ??
          imageLinks['smallThumbnail'] as String?;
    }

    return BookModel(
      id: json['id'] as String? ?? '',
      title: volumeInfo['title'] as String? ?? 'Unknown Title',
      authors: authors.isNotEmpty ? authors : ['Unknown Author'],
      thumbnail: thumbnail,
      description: volumeInfo['description'] as String?,
      publisher: volumeInfo['publisher'] as String?,
      publishedDate: volumeInfo['publishedDate'] as String?,
      pageCount: volumeInfo['pageCount'] as int?,
    );
  }

  BookEntity toEntity() {
    return BookEntity(
      id: id,
      title: title,
      authors: authors,
      thumbnail: thumbnail,
      description: description,
      publisher: publisher,
      publishedDate: publishedDate,
      pageCount: pageCount,
    );
  }
}