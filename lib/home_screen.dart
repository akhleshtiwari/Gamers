import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product('Monitor', 29.99, 'lib/assets/images/gamep1.png'),
    Product('Headphone', 39.99, 'lib/assets/images/gamep2.png'),
    Product('Keyboard', 49.99, 'lib/assets/images/game3.jpg'),
    Product('Mouse', 59.99, 'lib/assets/images/game4.jpeg'),
    Product('Chair', 59.99, 'lib/assets/images/game5.jpeg'),
    Product('Controller', 59.99, 'lib/assets/images/game6.jpeg'),
    Product('Headphone', 59.99, 'lib/assets/images/game7.jpeg'),
    Product('Chair', 59.99, 'lib/assets/images/game8.png'),
    Product('Desktop', 59.99, 'lib/assets/images/game9.png'),
    Product('Monitor', 59.99, 'lib/assets/images/game10.png'),
    Product('laptop', 59.99, 'lib/assets/images/game11.jpg'),
    Product('PC', 29.99, 'lib/assets/images/gamep1.png'),
    Product('Headphone', 39.99, 'lib/assets/images/gamep2.png'),
    Product('Keyboard', 49.99, 'lib/assets/images/game3.jpg'),
    Product('Mouse', 59.99, 'lib/assets/images/game4.jpeg'),
    Product('Chair', 59.99, 'lib/assets/images/game5.jpeg'),
    Product('Controller', 59.99, 'lib/assets/images/game6.jpeg'),
    Product('Headphone', 59.99, 'lib/assets/images/game7.jpeg'),
    Product('Chair', 59.99, 'lib/assets/images/game8.png'),
    Product('Desktop', 59.99, 'lib/assets/images/game9.png'),
    Product('Monitor', 59.99, 'lib/assets/images/game10.png'),
    Product('Desktop', 59.99, 'lib/assets/images/desktop.webp'),
    Product('Graphic Card', 59.99, 'lib/assets/images/graphicCard.png'),
    Product('Grapahic Card', 59.99, 'lib/assets/images/graphicCard.jpeg'),
    Product('Tshirt', 59.99, 'lib/assets/images/gamerTshirt.jpeg'),
    Product('Tshirt', 59.99, 'lib/assets/images/gamerTshirt1.jpeg'),
    Product('Speaker', 59.99, 'lib/assets/images/speaker.png'),
    Product('Wheel', 59.23, 'lib/assets/images/wheel.jpeg'),
    Product('Wheel', 59.66, 'lib/assets/images/wheel1.png'),
    Product('Gamepad', 59.99, 'lib/assets/images/gamepad.png'),
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: filterSearchResults,
                decoration: const InputDecoration(
                    hintText: 'Search Products...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white70),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, '/details', arguments: product),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(product.image, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(product.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('\u20B9 ${product.price}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.green)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
