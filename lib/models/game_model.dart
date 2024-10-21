class Game {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  int quantity;

  Game({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.quantity = 1,
  });
}
