import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Models/cart.dart';
import '../Models/products.dart';
import '../Models/cart.dart';

class DetailPage extends StatelessWidget {

  static const routeName = '/product_detail';
  final String title;
  final String description;
  final String img;
  final double price;

  DetailPage({this.price, this.description, this.img, this.title}) ;
    @override
    Widget build(BuildContext context) {
      final productId = ModalRoute.of(context)
          .settings
          .arguments as String;
      final cart=Provider.of<Cart>(context);

      final loadedPdt = Provider.of <Products>(context).findById(productId);
      return Scaffold(
          appBar: AppBar(
            title: Text(loadedPdt.name),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Padding(padding:
                const EdgeInsets.all(10),
                    child: Image.network(loadedPdt.imgUrl)),
              ),
              Text('Price: Rs.''${loadedPdt.price}', style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold
              ),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('${loadedPdt.description}', style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){cart.addItem(productId, loadedPdt.name, loadedPdt.price);},
            child: Icon(Icons.shopping_cart, size: 30),)
      );
    }
  }


