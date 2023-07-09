import 'package:flutter/material.dart';
import 'package:ecom/models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.image_url,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,style: Theme.of(context).textTheme.bodyLarge,),
                Text('\$${product.price}',style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle),),
              Text('1',style: Theme.of(context).textTheme.bodyLarge,),
              IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle),),

            ],
          )

        ],
      ),
    );
  }
}


