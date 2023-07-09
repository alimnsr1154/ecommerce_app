import 'package:ecom/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_app_bar(title: 'Cart Screen'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text(
                      'GO TO CHECKOUT',
                      style: Theme.of(context).textTheme.displaySmall,
                    ))
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              Map cart = state.cart.productQuantity(state.cart.products);
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(state.cart.freeDeliveryString,
                                  style: Theme.of(context).textTheme.bodySmall),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                                child: Text(
                                  'Add more items',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 340,
                            child: ListView.builder(
                              itemCount: cart.keys.length,
                              itemBuilder: (context, index) {
                                return product_card.cart(
                                    products: cart.keys.elementAt(index),
                                    quantity: cart.values.elementAt(index));
                              },
                            ),
                          ),
                          const OrderSummary(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ));
  }
}
