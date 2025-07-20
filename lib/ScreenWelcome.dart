import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  final int id;
  final String name;
  final double rating;
  final String delivery;
  final String time;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.delivery,
    required this.time,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      delivery: json['delivery'] ?? 'Free',
      time: json['time'] ?? '20 min',
      image: json['image'] ?? '',
    );
  }
}

Future<List<Product>> fetchProducts() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token'); // get token from login

  final response = await http.get(
    Uri.parse('https://demo.chanreykorn.com/api/products'),
    headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    print("API Error: ${response.body}");
    throw Exception('Failed to load products: ${response.body}');
  }
}

class ScreenWelcome extends StatelessWidget {
  final String username;

  const ScreenWelcome({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: \${snapshot.error}'));
          }

          final products = snapshot.data ?? [];

          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, "
                              "$username",
                              style: const TextStyle(
                                color: Color(0xFFfd8044),
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Text(
                              "Halal Lab office",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    const Text(
                      "Hey Halal, Good Afternoon",
                      style: TextStyle(fontSize: 20),
                    ),

                    // Search Box
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFf6f6f6),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Categories Title
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "All Categories",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF212f3d),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(color: Color(0xFF212f3d)),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 16,
                              color: Color(0xFF2c3e50),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Categories Chips
                    const SizedBox(height: 30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          categoryChip(
                            icon: Icons.local_fire_department,
                            label: 'All',
                          ),
                          categoryChip(
                            imagePath: 'assets/images/pizza.jpg',
                            label: 'Pizza',
                          ),
                          categoryChip(
                            imagePath: 'assets/images/profile.jpg',
                            label: 'Burger',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Open Restaurants",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF212f3d),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(color: Color(0xFF212f3d)),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 16,
                              color: Color(0xFF2c3e50),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Product Cards
                    Column(
                      children: products
                          .map((product) => buildProductCard(product))
                          .toList(),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://demo.chanreykorn.com/api/uploads/${product.image}',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.network(
                'https://demo.chanreykorn.com/api/uploads/default.png',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: const TextStyle(fontSize: 25, color: Color(0xFF273746)),
          ),
          const Text(
            'Burger - Chicken - Rice - Wings',
            style: TextStyle(color: Color(0xFF808b96)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    color: Color(0xFFfd8044),
                    size: 22,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(
                    Icons.delivery_dining,
                    color: Color(0xFFfd8044),
                    size: 22,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    product.delivery,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(
                    Icons.access_alarms_outlined,
                    color: Color(0xFFfd8044),
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    product.time,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryChip({
    IconData? icon,
    String? imagePath,
    required String label,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xfff0f3f4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Color(0xfff6f6f6),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: imagePath != null
                  ? Image.asset(imagePath, fit: BoxFit.cover)
                  : Icon(icon, color: Colors.orange, size: 35),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
