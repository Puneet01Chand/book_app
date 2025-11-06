import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    context.read<SearchBloc>().add(SearchEvent.started(query));
  }

  void _onSearchClear() {
    _searchController.clear();
    context.read<SearchBloc>().add(const SearchEvent.clear());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Books'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Search Bar with state handling
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return _buildSearchBar(context, state);
              },
            ),
            // Content Area
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildInitialState(),
                    loading: () => _buildLoadingState(),
                    success: (books, totalItems, query) {
                      print('Success state: ${books.length} books'); // Debug
                      return _buildDataState(
                        books: books,
                        totalItems: totalItems,
                        query: query,
                      );
                    },
                    empty: (query) => _buildEmptyState(query),
                    error: (message) => _buildErrorState(message),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, SearchState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for books...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _buildSearchSuffix(state, colorScheme),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colorScheme.error,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchChanged,
          ),
          // Status messages below search bar with fixed height
          // SizedBox(
          //   height: 32,
          //   child: _buildStatusMessage(state, colorScheme),
          // ),
        ],
      ),
    );
  }

  // Widget _buildStatusMessage(SearchState state, ColorScheme colorScheme) {
  //   if (state is SearchLoadingState) {
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 8),
  //       child: Row(
  //         children: [
  //           SizedBox(
  //             width: 16,
  //             height: 16,
  //             child: CircularProgressIndicator(
  //               strokeWidth: 2,
  //               color: Colors.deepPurple,
  //             ),
  //           ),
  //           const SizedBox(width: 8),
  //           Text(
  //             'Searching...',
  //             style: TextStyle(
  //               fontSize: 12,
  //               color: Colors.grey[600],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   // if (state is SearchSuccessState) {
  //   //   return Padding(
  //   //     padding: const EdgeInsets.only(top: 8),
  //   //     child: Row(
  //   //       children: [
  //   //         Icon(
  //   //           Icons.check_circle,
  //   //           color: Colors.green,
  //   //           size: 16,
  //   //         ),
  //   //         const SizedBox(width: 8),
  //   //         Text(
  //   //           'Found ${state.totalItems} ${state.totalItems == 1 ? 'result' : 'results'}',
  //   //           style: TextStyle(
  //   //             fontSize: 12,
  //   //             color: Colors.green,
  //   //           ),
  //   //         ),
  //   //       ],
  //   //     ),
  //   //   );
  //   // }
  //
  //   if (state is SearchEmptyState) {
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 8),
  //       child: Row(
  //         children: [
  //           Icon(
  //             Icons.info_outline,
  //             color: Colors.orange,
  //             size: 16,
  //           ),
  //           const SizedBox(width: 8),
  //           Text(
  //             'No results found',
  //             style: TextStyle(
  //               fontSize: 12,
  //               color: Colors.orange,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   if (state is SearchErrorState) {
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 8),
  //       child: Row(
  //         children: [
  //           Icon(
  //             Icons.error_outline,
  //             color: colorScheme.error,
  //             size: 16,
  //           ),
  //           const SizedBox(width: 8),
  //           Expanded(
  //             child: Text(
  //               state.message,
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 color: colorScheme.error,
  //               ),
  //               maxLines: 2,
  //               overflow: TextOverflow.ellipsis,
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   return const SizedBox.shrink();
  // }

  Widget _buildSearchSuffix(SearchState state, ColorScheme colorScheme) {
    return SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (state is SearchLoadingState)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            )
          else if (_searchController.text.isNotEmpty) ...[
            if (state is SearchSuccessState)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            if (state is SearchErrorState)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.error,
                  color: colorScheme.error,
                  size: 20,
                ),
              ),
            IconButton(
              icon: const Icon(Icons.clear, size: 20),
              onPressed: _onSearchClear,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book_rounded,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 24),
          Text(
            'Search for a book to get started',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching for "Flutter" or "Dune"',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Searching for books...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.red[300],
            ),
            const SizedBox(height: 24),
            Text(
              'Oops! Something went wrong',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context.read<SearchBloc>().add(const SearchEvent.refresh());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String query) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              'No books found for "$query"',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataState({
    required List books,
    required int totalItems,
    required String query,
  }) {
    print('Building data state with ${books.length} books'); // Debug

    if (books.isEmpty) {
      return _buildEmptyState(query);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        print('Building book item: ${book.title}'); // Debug
        return BookListItem(
          title: book.title,
          authors: book.authors ?? [],
          thumbnail: book.thumbnail ?? '',
          onTap: () {
            // TODO: Navigate to book detail
            // context.router.push(BookDetailRoute(book: book));
            print('Tapped on: ${book.title}');
          },
        );
      },
    );
  }
}

// ========== BOOK LIST ITEM WIDGET ==========
class BookListItem extends StatelessWidget {
  final String title;
  final List<String> authors;
  final String thumbnail;
  final VoidCallback onTap;

  const BookListItem({
    Key? key,
    required this.title,
    required this.authors,
    required this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: thumbnail.isNotEmpty
                    ? Image.network(
                  thumbnail,
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder();
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildPlaceholder();
                  },
                )
                    : _buildPlaceholder(),
              ),
              const SizedBox(width: 16),
              // Book Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    if (authors.isNotEmpty)
                      Text(
                        authors.join(', '),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 80,
      height: 120,
      color: Colors.grey[300],
      child: Icon(
        Icons.book,
        size: 40,
        color: Colors.grey[600],
      ),
    );
  }
}