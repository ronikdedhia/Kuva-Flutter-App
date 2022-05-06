import 'package:flutter/material.dart';
import 'package:kuva/models/affirmations.dart';
import 'package:kuva/widgets/affirmation.dart';
class FavoritesScreen extends StatelessWidget {
  final  List<Affirmations>favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty)
    {
    return Center(child: Text('Favroites'),
      
    );}
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return AffirmationItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            
           
           
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}