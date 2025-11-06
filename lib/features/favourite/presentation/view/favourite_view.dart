import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate favorites list (in real app, this comes from state management)
    // final List<Map<String, dynamic>> favorites = [
    //   {
    //     'title': 'Favorite Book 1',
    //     'authors': ['Author Name'],
    //     'thumbnail': 'https://via.placeholder.com/128x192/deepPurple/white?text=Fav+1',
    //   },
    //   {
    //     'title': 'Favorite Book 2',
    //     'authors': ['Another Author', 'Co-Author'],
    //     'thumbnail': 'https://via.placeholder.com/128x192/deepPurple/white?text=Fav+2',
    //   },
    // ];

    // Change this to true to see empty state
    // final bool isEmpty = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: _buildEmptyState(),
    //   :ListView.builder(
      //         padding: const EdgeInsets.all(16),
      //         itemCount: favorites.length,
      //         itemBuilder: (context, index) {
      //           final book = favorites[index];
      //           return BookListItem(
      //             title: book['title'],
      //             authors: List<String>.from(book['authors']),
      //             thumbnail: book['thumbnail'], onTap: () {  },
      //           );
      //         },
      //       ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 24),
          Text(
            "You haven't added any favorites yet",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Start searching and add books you love!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}