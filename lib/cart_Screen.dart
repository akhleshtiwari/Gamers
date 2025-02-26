import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> cart = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final product = ModalRoute.of(context)?.settings.arguments as Product?;
    if (product != null && !cart.contains(product)) {
      setState(() {
        cart.add(product);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        title: const Text(
          'Cart',
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text('Your Cart is Empty', style: TextStyle(fontSize: 20)))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  leading: Image.asset(product.image,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
      bottomNavigationBar: cart.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple),
                  child: const Center(
                    child: Text(
                      "Proceed to Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
