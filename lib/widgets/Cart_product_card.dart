import 'package:ecom/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecom/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard(
      {super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.asset(
            product.image_url,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartRemove(product));
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Text(
                    quantity.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartAdded(product));
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
