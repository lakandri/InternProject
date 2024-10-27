import 'package:flutter/material.dart';
import 'package:internproject/Screens/models/model.dart';

class OrderSummaryPage extends StatelessWidget {
  final List<Product> products; // Pass product list as a parameter

  OrderSummaryPage(this.products);

  @override
  Widget build(BuildContext context) {
    double total = products.fold(0, (sum, product) => sum + product.price);

    return Scaffold(
      appBar: AppBar(title: const Text("Order Summary")),
      body: Column(
        children: [
          ...products.map((product) => ListTile(
                title: Text(product.name),
                trailing: Text("\$${product.price}"),
              )),
          const Divider(),
          ListTile(
            title: const Text("Total"),
            trailing: Text("\$${total}"),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Payment Screen
            },
            child: const Text("Proceed to Payment"),
          ),
        ],
      ),
    );
  }
}
