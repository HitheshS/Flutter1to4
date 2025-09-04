import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListViewDemo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Custom List View',
            style: TextStyle(letterSpacing: 5),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            MyListItem(
              fruitname: "Apple",
              price: 180,
              image: 'assets/images/apple.jpg',
            ),
            MyListItem(
              fruitname: "Banana",
              price: 60,
              image: 'assets/images/banana.jpg',
            ),
            MyListItem(
              fruitname: "Orange",
              price: 120,
              image: 'assets/images/orange.jpg',
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyListItem extends StatelessWidget {
  final String fruitname;
  final int price;
  final String image;

  const MyListItem({
    super.key,
    required this.fruitname,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fruitname,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("₹ $price / kg",
                  style: const TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Buy Now"),
              )
            ],
          )
        ],
      ),
    );
  }
}
