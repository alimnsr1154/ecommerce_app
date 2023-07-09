import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  const ProductScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings:RouteSettings(name : routeName) ,
        builder: (_)=> ProductScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Product Screen'),
      bottomNavigationBar:const Custom_nav_bar(),
    );
  }
}

