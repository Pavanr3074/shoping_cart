
import 'package:flutter/material.dart';
import 'package:shop/Widgets/home_body.dart';
import 'package:shop/pages/cart_screen.dart';



class home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart,size: 30), onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
        ],
      ),
      body:HomeBody()
    );
  }
}
