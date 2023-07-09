import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if(state is CategoryLoading)
                  {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                if(state is CategoryLoaded)
                  {   return
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.5,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: state.categories.map((category) => HeroCarousalCard(category: category)).toList(),
                    );
                  }
                else
                  {
                    return const Text('something went wrong');
                  }

  },
),
            const SectionTitle(title: 'RECOMMENDED',),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if(state is ProductLoading)
                  {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                if(state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products.where((product) => product
                        .isRecommended).toList(),);
                }
                else
                  {
                    return const Text('Something went wrong');
                  }
                },
              ),
            
            const SectionTitle(title: 'MOST POPULAR',),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if(state is ProductLoading)
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is ProductLoaded) {
                  return ProductCarousel(
                    products: state.products.where((product) => product
                        .isPopular).toList(),);
                }
                else
                {
                  return const Text('Something went wrong');
                }
              },
            ),

          ],
        ),
      ),

    );
  }
}

