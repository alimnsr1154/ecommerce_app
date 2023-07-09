import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  const WishlistScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings:RouteSettings(name : routeName) ,
        builder: (_)=> WishlistScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Wishlist Screen'),
      bottomNavigationBar:const Custom_nav_bar(),
    );
  }
}

