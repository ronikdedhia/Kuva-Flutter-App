import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
class Affirmations
{
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> audioName;
  final List<String> affirmations;
  
   bool akValue;


  
  Affirmations({@required this.id,@required this.title,@required this.categories,@required this.imageUrl,
  @required this.affirmations,@required this.audioName,@required this.akValue });



  
}