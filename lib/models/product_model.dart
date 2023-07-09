import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  late final String name;
  late final String category;
  late final String image_url;
  late final double price;
  late final bool isRecommended;
  late final bool isPopular;

  Product({
    required this.name,
    required this.category,
    required this.image_url,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });




  static Product fromSnapshot(DocumentSnapshot snap)
  {
    Product product  = Product(
        name: snap['name'],
        category: snap['category'],
        image_url: snap['image_url'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }


  static List<Product> products = [
   Product(name: 'Soft Drink #1',
       category: 'Soft Drinks',
       image_url: 'images/coke.jpg',
       price: 2.99,
       isRecommended: true,
       isPopular: false),
   Product(name: 'Smoothie #1',
       category: 'Smoothies',
       image_url: 'images/blueberry_smoothie.jpeg',
       price: 2.99,
       isRecommended: false ,
       isPopular: true),
   Product(name: 'Soft Drink #2',
       category: 'Soft Drinks',
       image_url: 'images/sprite.jpg',
       price: 2.99,
       isRecommended: true,
       isPopular: true),
   Product(name: 'Smoothie #2',
       category: 'Smoothies',
       image_url: 'images/chocolate_smoothie.jpg',
       price: 2.99,
       isRecommended: false,
       isPopular: false),
   Product(name: 'Soft Drink #3',
       category: 'Soft Drinks',
       image_url: 'images/dew.jpg',
       price: 2.99,
       isRecommended: true,
       isPopular: false),
   Product(name: 'Smoothie #3',
       category: 'Smoothies',
       image_url: 'images/strawberry_smoothie.jpeg',
       price: 2.99,
       isRecommended: false,
       isPopular: true),
 ];





  @override
  // TODO: implement props
  List<Object?> get props => [name,category,image_url,price,isRecommended,isPopular];


}