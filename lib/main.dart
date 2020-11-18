import 'package:flutter/material.dart';
import 'package:shop/Models/cart.dart';
import 'package:shop/Models/orders.dart';
import 'package:shop/Models/products.dart';
import 'package:shop/pages/cart_screen.dart';
import 'package:shop/pages/pdt_detail.dart';
import 'package:shop/setup/signin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: loginpage(),
        routes: {
          DetailPage.routeName: (ctx)=>DetailPage(),
          CartScreen.routeName: (ctx)=>CartScreen(),
        },
      ),
    );
  }
}
