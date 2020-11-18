import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({@required this.price,@required this.name,@required this.id,@required this.quantity});

}
class Cart with ChangeNotifier
{
  Map<String,CartItem> _items={};
  Map<String,CartItem> get items{
    return {..._items};
  }
  int get itemCount{
    return _items.length;
  }
  void addItem(String pdtid,String name,double price){
    if(_items.containsKey(pdtid)){
      _items.update(pdtid, (existingCartItem) => CartItem(price:existingCartItem.price , name:existingCartItem.name , id:DateTime.now().toString() , quantity:existingCartItem.quantity+1 ));
    }
    else{
      items.putIfAbsent(pdtid, () => CartItem(price: price, name: name, id: DateTime.now().toString() , quantity: 1));
    }
 notifyListeners();
  }
  void removeItem(String id){
    _items.remove(id);
    notifyListeners();
  }
  void removeSingleItem(String id){
    if(!_items.containsKey(id)){
      return;
    }if(_items[id].quantity>1){
      _items.update(id, (existingCartItem) =>  CartItem(price:existingCartItem.price , name:existingCartItem.name , id:DateTime.now().toString() , quantity:existingCartItem.quantity-1 ));
    }
    notifyListeners();
  }
  double get totalAmount{
    var total=0.0;
    _items.forEach((key, cartItem) {
      total +=cartItem.price*cartItem.quantity;
    });
    return total;
  }

  void clear(){
    _items={};
    notifyListeners();
  }

  }
