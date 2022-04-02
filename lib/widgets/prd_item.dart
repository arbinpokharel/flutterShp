import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/prd_overview.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductOverviewScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: ElevatedButton(
            child: Text(
              'BUY',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
