import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String category;
  final String name;
  final String description;
  final String imgUrl;
  final double price;

  Product({@required this.name,@required this.category,@required this.description,@required this.id,@required this.imgUrl,@required this.price});

}
class Products with ChangeNotifier {
  List<Product> _items = [
    Product(name: 'HP',
        category: "Laptop",
        description: 'Laptops are the most productive devices',
        id: '1',
        imgUrl: 'https://images-na.ssl-images-amazon.com/images/I/81pezrPSgOL._SL1500_.jpg',
        price: 75000),
    Product(name: 'Iphone12',
        category: 'Phones',
        description: 'Iphone12 is the most stylish phone ever',
        id: '2',
        imgUrl: 'https://specials-images.forbesimg.com/imageserve/5f766465171081b47b0e73ad/960x0.jpg?fit=scale',
        price: 80000),
    Product(name: 'Rolex',
        category: 'Watches',
        description: 'This watch suits to any apparel',
        id: '3',
        imgUrl: 'https://luxurylaunches.com/wp-content/uploads/2017/09/rolex-watch.jpg',
        price: 25000),
    Product(name: "God of war 4",
        category: 'Games',
        description: 'The best Graphics enhanced game ever',
        id: '4',
        imgUrl: 'https://images-na.ssl-images-amazon.com/images/I/811czebxtnL._SL1500_.jpg',
        price: 5000),
    Product(name: 'Ipad',
        category: 'Tablet',
        description: 'Ipads are the best devices to stream videos',
        id: '5',
        imgUrl: 'https://images-na.ssl-images-amazon.com/images/I/81twYxZsx0L._AC_SX466_.jpg',
        price: 90000)
  ];

  List<Product> get items {
    return [..._items];
  }
  Product findById(String id){
    return _items.firstWhere((pdt) => pdt.id==id);
  }
}