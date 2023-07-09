import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings:RouteSettings(name : routeName) ,
        builder: (_)=> CartScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Cart Screen'),
      bottomNavigationBar:const Custom_nav_bar(),
    );
  }
}

