import 'package:flutter/material.dart';
import '../models/game_model.dart';

class CartPage extends StatefulWidget {
  final List<Game> cart;
  final Function(Game) removeFromCart;
  final Function(Game, int) updateQuantity;

  const CartPage({super.key, 
    required this.cart,
    required this.removeFromCart,
    required this.updateQuantity,
  });

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotalPrice() {
    return widget.cart.fold(0, (total, game) => total + game.price * game.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: widget.cart.isEmpty
          ? const Center(child: Text('Корзина пуста'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                Game game = widget.cart[index];
                return Dismissible(
                  key: Key(game.name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      game.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(game.name),
                    subtitle: Text('\$${game.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (game.quantity > 1) {
                              widget.updateQuantity(game, game.quantity - 1);
                            }
                          },
                        ),
                        Text(game.quantity.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            widget.updateQuantity(game, game.quantity + 1);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Общая сумма: \$${calculateTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text('Купить'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
