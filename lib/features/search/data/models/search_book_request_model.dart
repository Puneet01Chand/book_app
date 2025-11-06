class SearchBooksRequest {
  final String query;

  SearchBooksRequest({required this.query});

  Map<String, dynamic> toQueryParams() {
    return {
      'q': query,
    };
  }
}