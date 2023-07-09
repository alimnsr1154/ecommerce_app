import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings:const RouteSettings(name : routeName) ,
        builder: (_)=> const HomeScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Zero to Unicorn'),
      bottomNavigationBar:const Custom_nav_bar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,

                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories.map((categorys) => HeroCarousalCard(category: categorys)).toList(),
            ),
            const SectionTitle(title: 'RECOMMENDED',),
            ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList(),),
            const SectionTitle(title: 'MOST POPULAR',),
            ProductCarousel(products: Product.products.where((product) => product.isPopular).toList(),)

          ],
        ),
      ),

    );
  }
}

