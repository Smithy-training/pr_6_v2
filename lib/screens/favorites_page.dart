import 'package:flutter/material.dart';
import '../models/game_model.dart';
import '../widgets/game_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<Game> favorites;
  final Function(Game) toggleFavorite;
  final Function(Game) addToCart;

  const FavoritesPage({super.key, 
    required this.favorites,
    required this.toggleFavorite,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('Избранных товаров нет'))
          : GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          Game game = favorites[index];
          return GameCard(
            game: game,
            isFavorite: true,
            onTap: () {
            },
            onAddToCart: () => addToCart(game),
            onToggleFavorite: () => toggleFavorite(game),
          );
        },
      ),
    );
  }
}

