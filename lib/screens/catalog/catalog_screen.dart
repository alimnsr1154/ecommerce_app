import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  const CatalogScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings:RouteSettings(name : routeName) ,
        builder: (_)=> CatalogScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Catalog Screen'),
      bottomNavigationBar:const Custom_nav_bar(),
    );
  }
}

