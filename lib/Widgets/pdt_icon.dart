

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Models/products.dart';
import 'package:shop/pages/pdt_detail.dart';
import '../Models/cart.dart';


class PdtItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  PdtItem({this.imgUrl,this.name});
  @override
  Widget build(BuildContext context) {
    final pdt=Provider.of<Product>(context);
    final cart=Provider.of<Cart>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DetailPage.routeName,arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child: Image.network(imgUrl),
          footer: GridTileBar(
            title: Text(name),
            trailing: IconButton(icon: Icon(Icons.shopping_cart),
                onPressed: (){
              Scaffold.of(context).showSnackBar(SnackBar(
                  duration:Duration(seconds: 3),
                  content: Text('Item added to cart')
                ));
                cart.addItem(pdt.id, pdt.name, pdt.price);}),
            backgroundColor: Colors.black54,
          )
        ),
      ),
    );
  }
}
