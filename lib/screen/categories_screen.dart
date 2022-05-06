import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  static List items;
  final nameRoute='/category-affirmation';
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:
         const EdgeInsets.all(25)
        ,children:
         DUMMY_CATEGORIES.map((catData)=>CategoryItem(catData.id,catData.title,catData.color,catData.color,catData.iconname)).toList(),gridDelegate:
     SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20)
      
      );
  }
}