import 'package:flutter/material.dart';
import '../Models/cart.dart';
import 'package:provider/provider.dart';
class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  CartPdt({this.id,this.quantity,this.name,this.price,this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(color: Colors.red,),
      onDismissed: (direction){Provider.of<Cart>(context).removeItem(productId);},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child:Text('\$$price'),
            ),
          ),
          title:Text(name),
            subtitle: Text('Total: \$${(price*quantity)}',),
      trailing: Text('$quantity x'),
        )),
    );
  }
}
