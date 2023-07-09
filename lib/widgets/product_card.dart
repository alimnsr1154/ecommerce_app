import 'package:ecom/bloc/cart/cart_bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class product_card extends StatelessWidget {
  final Product products;
  final double width;
  final double leftPosition;
  final bool isWishlist;
  const product_card({
    super.key,
    required this.products,
    this.width = 2.5,
    this.leftPosition = 0,
    this.isWishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    double widthvalue = MediaQuery.of(context).size.width / width;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product',arguments: products);
      },
      child: Stack(
        children: [
          Container(
            width: widthvalue,
            height: 150,
            child: Image.network(products.image_url,
              fit: BoxFit.cover,),
          ),
          Positioned(
            top: 85,
            left: leftPosition,
            child: Container(
              width: widthvalue - leftPosition,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: leftPosition + 5,
            child: Container(
              width: widthvalue - 10 - leftPosition,
              height: 45,
              decoration: const BoxDecoration(
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
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if(state is CartLoading)
                          {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        if(state is CartLoaded) {
                          return Expanded(child: IconButton(onPressed: (){
                          context.read<CartBloc>().add(CartAdded(products));
                        }, icon: const Icon(Icons.add_circle,color: Colors.white,)));
                        }
                        else {
                          return const Text('Something Went Wrong',style: TextStyle(fontSize: 2,color: Colors.white),);
                        }

                      },
                    ),
                    isWishlist ?
                    Expanded(child: IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.white,)))
                        : const SizedBox(),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
