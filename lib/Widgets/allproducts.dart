import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shop/Models/products.dart';
import 'pdt_icon.dart';


class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final pdts= productData.items;
    return GridView.builder(
        physics: ScrollPhysics(),
    shrinkWrap: true,
    itemCount:pdts.length ,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (ctx,i)=>ChangeNotifierProvider.value(value: pdts[i],
    child: PdtItem(imgUrl: pdts[i].imgUrl, name: pdts[i].name))
    );
  }
}
