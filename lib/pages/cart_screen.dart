import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Models/cart.dart';
import '../Widgets/cartitem.dart';
import '../Models/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName='/cart';
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title:Text('My Cart',style:TextStyle(fontSize: 30,color: Theme.of(context).accentColor) )),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
            itemBuilder: (ctz,i)=> CartPdt(id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                name: cart.items.values.toList()[i].name)),
          ),
          Text("Swipe to remove the item",style:TextStyle(fontSize: 20,)),
         CheckoutButton(cart: cart)
        ],
      ),

    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;
  CheckoutButton({this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(child:
    Text('Checkout'),
        onPressed:widget.cart.totalAmount<=0?null:() async {
      await Provider
          .of<Orders>(context, listen: false)
          .addOrder(widget.cart.items.values.toList(),
          widget.cart.totalAmount)
      ;
      widget.cart.clear();
    });

  }
}

