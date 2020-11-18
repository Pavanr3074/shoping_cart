import 'package:flutter/material.dart';
import 'package:shop/Widgets/category.dart';
import 'package:shop/Widgets/allproducts.dart';
 class HomeBody extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return ListView(
       children: <Widget>[
         Center(child: Text('Categories', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
         SizedBox(height: 20),
         Category(),
         Text('Products', style: TextStyle(fontSize: 40)),
         AllProducts(),

       ],
     );


   }
 }
 