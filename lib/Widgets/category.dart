import 'package:flutter/material.dart';
import 'package:shop/Widgets/category_card.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:<Widget>[
          CategoryCard(
              Icon(Icons.book,size: 40)
              , 'Book'),
          CategoryCard(
              Icon(Icons.computer,size: 40)
              , 'Computers'),
          CategoryCard(
              Icon(Icons.videogame_asset,size: 40)
              , 'Games'),
          CategoryCard(
              Icon(Icons.watch,size: 40)
              , 'Watches'),
          CategoryCard(
              Icon(Icons.phone,size: 40)
              , 'Phones'),
          CategoryCard(
              Icon(Icons.tablet,size: 40)
              , 'Tablets')
              ],
            ),
          );





  }
}

