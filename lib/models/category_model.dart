import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable{
   final String name;
   final String img_url;

  const Category({required this.name,required this.img_url});
  @override
  // TODO: implement props
  List<Object?> get props => [name,img_url];

static List<Category> categories = [
  const Category(name: 'Soft Drinks', img_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
  const Category(name: 'Smoothies', img_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
  const Category(name: 'Water', img_url: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),

];


}