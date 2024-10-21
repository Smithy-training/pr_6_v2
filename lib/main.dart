import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/favorites_page.dart';
import 'screens/cart_page.dart';
import 'screens/profile_page.dart';
import 'models/game_model.dart';

void main() {
  runApp(const StomApp());
}

class StomApp extends StatelessWidget {
  const StomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stom Game Store',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Game> favorites = [];
  List<Game> cart = [];

  final List<Game> allGames = [
    Game(
      name: 'Cuphead',
      price: 19.99,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/e/eb/Cuphead_(artwork).png',
      description: 'Action platformer and smth',
    ),
    Game(
      name: 'Elden Ring',
      price: 59.99,
      imageUrl: 'https://www.cnet.com/a/img/resize/43bf7152f39f90a03df23c97a8a7ebb9a09ea520/hub/2022/02/23/f12a8db7-d99b-4b8d-9b09-d84f12661cf7/elden-ring-plakat.jpg?auto=webp&fit=bounds&height=1200&precrop=571,571,x357,y149&width=1200',
      description: 'Open-world action RPG and nth',
    ),
  ];

  void toggleFavorite(Game game) {
    setState(() {
      if (favorites.contains(game)) {
        favorites.remove(game);
      } else {
        favorites.add(game);
      }
    });
  }

  void addToCart(Game game) {
    setState(() {
      if (!cart.contains(game)) {
        cart.add(game);
      }
    });
  }

  void removeFromCart(Game game) {
    setState(() {
      cart.remove(game);
    });
  }

  final List<Widget> _pages;

  _MainScreenState() : _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePage(allGames: allGames, favorites: favorites, cart: cart, toggleFavorite: toggleFavorite, addToCart: addToCart),
      FavoritesPage(favorites: favorites, toggleFavorite: toggleFavorite, addToCart: addToCart),
      CartPage(cart: cart, removeFromCart: removeFromCart, updateQuantity: (Game , int ) {  },),
      const ProfilePage(),
    ]);
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}
