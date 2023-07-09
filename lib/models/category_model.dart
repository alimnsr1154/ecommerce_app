import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String name;
  final String img_url;

  const Category({required this.name, required this.img_url});

  @override
  List<Object?> get props => [name, img_url];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'], img_url: snap['img_url']);
    return category;
  }

  static List<Category> categories = [
    const Category(name: 'Soft Drinks', img_url: 'images/soft_drinks.jpg'),
    const Category(name: 'Smoothies', img_url: 'images/smoothies.jpg'),
    const Category(name: 'Water', img_url: 'images/water.jpg'),
  ];
}
