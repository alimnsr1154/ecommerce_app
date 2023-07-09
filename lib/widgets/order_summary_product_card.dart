import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard(
      {super.key, required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.asset(
            product.image_url,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Qty. $quantity',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Qty. 2',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
