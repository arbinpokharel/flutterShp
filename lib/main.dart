import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_shop/providers/cart.dart';
import 'package:se_shop/providers/products.dart';
import 'package:se_shop/screens/prd_detail.dart';
import 'screens/prd_overview.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: ((ctx) => Cart()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Shoping',
        home: ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
