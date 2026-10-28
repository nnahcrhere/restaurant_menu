
import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: const MenuScreen(),
    );
  }
}

class Food {
  final String name;
  final String description;
  final String price;
  final String emoji;

  const Food({
    required this.name,
    required this.description,
    required this.price,
    required this.emoji,
  });
}

const List<Food> foods = [
  Food(
    name: 'Chicken Burger',
    description: 'Juicy grilled chicken burger with fresh vegetables.',
    price: 'RM 12.90',
    emoji: '🍔',
  ),
  Food(
    name: 'Pizza',
    description: 'Delicious cheese pizza with fresh toppings.',
    price: 'RM 18.90',
    emoji: '🍕',
  ),
  Food(
    name: 'Fried Chicken',
    description: 'Crispy fried chicken served hot and fresh.',
    price: 'RM 10.90',
    emoji: '🍗',
  ),
];

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Our Delicious Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your favourite food!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              ...foods.map((food) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Text(
                      food.emoji,
                      style: const TextStyle(fontSize: 45),
                    ),
                    title: Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(food.price),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.deepOrange,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FoodDetailScreen(food: food),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final Food food;

  const FoodDetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                food.emoji,
                style: const TextStyle(fontSize: 100),
              ),
              const SizedBox(height: 20),
              Text(
                food.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                food.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                food.price,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
