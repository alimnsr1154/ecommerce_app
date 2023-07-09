import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  final Category category;

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryproduct = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: Custom_app_bar(title: category.name),
      bottomNavigationBar: const Custom_nav_bar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12),
            itemCount: categoryproduct.length,
            itemBuilder: (BuildContext context, index) {
              return product_card.catalog(
                products: categoryproduct[index],
              );
            }),
      ),
    );
  }
}
