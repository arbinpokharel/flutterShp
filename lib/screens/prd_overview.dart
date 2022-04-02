import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:se_shop/providers/cart.dart';
import 'package:se_shop/widgets/prd_grid.dart';

enum filterOptions { favorite, all }

class ProductOverviewScreen extends StatefulWidget {
  static const routeName = '/product-overview';

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produt Overview'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (filterOptions value) {
                setState(() {
                  if (value == filterOptions.favorite) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => const [
                    PopupMenuItem(
                      child: Text('Show Favorites'),
                      value: filterOptions.favorite,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: filterOptions.all,
                    )
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) {
              Badge(
                badgeContent: cart.itemCount.toString(),
              );
            },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
