import 'package:flutter/material.dart';

class CatogoryModel {
  final String id;
  final String imagePath;
  final String title;
  final Color color;

  CatogoryModel(
      {
       required this.id, 
      required this.imagePath,
      required this.title,
      required this.color});
}
