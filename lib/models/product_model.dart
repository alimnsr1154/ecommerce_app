import 'dart:ffi';

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

 static List<Product> products = [
   Product(name: 'Soft Drink #1',
       category: 'Soft Drinks',
       image_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
       price: 2.99,
       isRecommended: true,
       isPopular: false),
   Product(name: 'Soft Drink #2',
       category: 'Soft Drinks',
       image_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
       price: 2.99,
       isRecommended: false ,
       isPopular: true),
   Product(name: 'Soft Drink #3',
       category: 'Soft Drinks',
       image_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
       price: 2.99,
       isRecommended: true,
       isPopular: true),
   Product(name: 'Soft Drink #4',
       category: 'Soft Drinks',
       image_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
       price: 2.99,
       isRecommended: false,
       isPopular: false),
   Product(name: 'Soft Drink #5',
       category: 'Soft Drinks',
       image_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
       price: 2.99,
       isRecommended: true,
       isPopular: false),
   Product(name: 'Soft Drink #6',
       category: 'Soft Drinks',
       image_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
       price: 2.99,
       isRecommended: false,
       isPopular: true),
 ];





  @override
  // TODO: implement props
  List<Object?> get props => [name,category,image_url,price,isRecommended,isPopular];


}