import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: 150,
                width: double.infinity,
                // alignment: Alignment.center,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.purple,
              ),
            ),
            Text(
              loadedProduct.description,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.pink,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
