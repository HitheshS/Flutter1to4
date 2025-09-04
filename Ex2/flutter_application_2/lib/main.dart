import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Product Catalog",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Product List View',
            style: TextStyle(letterSpacing: 5),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            MyListItem(
              fruitname: "Samsung Galaxy S25 Ultra",
              price: 107500,
              image: 'assets/images/SAM.jpeg',
            ),
            MyListItem(
              fruitname: "Xiaomi Redmi 15",
              price: 14999,
              image: 'assets/images/Redmi.jpeg',
            ),
            MyListItem(
              fruitname: "iPhone 16 Pro Max",
              price: 130900,
              image: 'assets/images/iphone.jpeg'
            ),
            MyListItem(
              fruitname: "vivo X200 FE",
              price: 54999,
              image: 'assets/images/vivo.jpeg',
            ),
            MyListItem(
              fruitname: "OnePlus Nord CE 5 5G",
              price: 24998,
              image: 'assets/images/oneplus.jpeg',
            ),
            MyListItem(
              fruitname: "Nothing Phone (3a) Pro ",
              price: 28067,
              image: 'assets/images/Nothing.jpeg',)
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
