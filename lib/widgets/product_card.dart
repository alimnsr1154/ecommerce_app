import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';

class product_card extends StatelessWidget {
  final Product products;
  const product_card({
    super.key,
    required this.products
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150,
          child: Image.network(products.image_url,
            fit: BoxFit.cover,),
        ),
        Positioned(
          top: 60,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.name,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                        Text(
                          '\$${products.price}',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),

                      ],
                    ),
                  ),
                  Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Colors.white,))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
