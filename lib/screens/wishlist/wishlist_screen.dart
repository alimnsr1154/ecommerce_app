import 'package:ecom/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Wishlist Screen'),
      bottomNavigationBar: const Custom_nav_bar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if(state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is WishlistLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                ),
                itemCount: state.wishList.products.length,
                itemBuilder: (BuildContext context, index) {
                  return Center(
                    child: product_card.wishlist(
                      products:  state.wishList.products[index],
                    ),
                  );
                }),
            );
          }
          else{
            return const Text('something went wrong');
          }
        },
      ),
    );
  }
}

