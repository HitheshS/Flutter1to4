import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final int price;
  final int quantity;

  Product({required this.name, required this.price, required this.quantity});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dynamic ListView",
      theme: ThemeData.dark(), // Dark theme like your screenshot
      home:  ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(name: "Apple Laptop", price: 100000, quantity: 5),
    Product(name: "HP Laptop", price: 80000, quantity: 3),
    Product(name: "Iphone 16", price: 70000, quantity: 6),
    Product(name: "Samsung Mobile", price: 50000, quantity: 2),
    Product(name: "Smart TV", price: 45000, quantity: 10),
    Product(name: "OnePlus Mobile", price: 40000, quantity: 5),
  ];

  void _showOrderDialog(BuildContext context, String productName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Product Order Form"),
        content: Text("$productName order is placed!!"),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic ListView",
            style: TextStyle(letterSpacing: 3)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final prod = products[index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(prod.name[0]),
                ),
                title: Text(prod.name),
                subtitle: Text("₹ ${prod.price}, Quantity: ${prod.quantity}"),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    _showOrderDialog(context, prod.name);
                  },
                  child: const Text("Order More"),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
