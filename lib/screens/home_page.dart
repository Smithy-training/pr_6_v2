import 'package:flutter/material.dart';
import '../models/game_model.dart';
import '../widgets/game_card.dart';

class HomePage extends StatelessWidget {
  final List<Game> allGames;
  final List<Game> favorites;
  final List<Game> cart;
  final Function(Game) toggleFavorite;
  final Function(Game) addToCart;

  const HomePage({super.key, 
    required this.allGames,
    required this.favorites,
    required this.cart,
    required this.toggleFavorite,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: allGames.length,
        itemBuilder: (context, index) {
          Game game = allGames[index];
          return GameCard(
            game: game,
            isFavorite: favorites.contains(game),
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
