import 'package:flutter/material.dart';
import 'package:kuva/models/affirmations.dart';


import '../widgets/affirmation.dart';

import '../models/affirmations.dart';

class CategoryAffirmationScreen extends StatefulWidget {
  final List<Affirmations> availableAffirmation;
  CategoryAffirmationScreen(this.availableAffirmation);
  static const routeName = '/category-affirmation';
  @override
  _CategoryAffirmationScreenState createState() => _CategoryAffirmationScreenState();
}
class _CategoryAffirmationScreenState extends State<CategoryAffirmationScreen> {
  String categoryTitle;
  List<Affirmations> displayedAffirmations;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedAffirmations = widget.availableAffirmation.where((aff) {
        return aff.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeAffirmation(String affId) {
    setState(() {
      displayedAffirmations.removeWhere((aff) => aff.id == affId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return AffirmationItem(
            id: displayedAffirmations[index].id,
            title: displayedAffirmations[index].title,
            imageUrl: displayedAffirmations[index].imageUrl,
            
            
           
          );
        },
        itemCount: displayedAffirmations.length,
      ),
    );
  }
}
