import 'package:flutter/material.dart';
import 'package:flutter_ai_integration/presentation/view/ingredients_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          Card(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restaurant_menu, size: 48),
                    const SizedBox(height: 16),
                    const Text(
                      'Cari Resep berdasarkan bahan',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const IngredientsPage(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 48),
                    const SizedBox(height: 16),
                    const Text(
                      'Cari Resep dari gambar',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/recipe');
              },
            ),
          ),
        ],
      ),
    );
  }
}
