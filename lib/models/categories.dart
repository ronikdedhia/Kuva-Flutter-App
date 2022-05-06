import 'package:flutter/material.dart';

class Category
{
  final String id;
  final String title;
  final Color color;
  final Icon iconname;
const Category({
  this.id,
    this.title,
    this.color=Colors.orange,
    this.iconname});
}