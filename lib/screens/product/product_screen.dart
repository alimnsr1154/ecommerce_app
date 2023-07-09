import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/bloc/cart/cart_bloc.dart';
import 'package:ecom/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  final Product product;
  const ProductScreen({super.key,required this.product});

  static Route route({required Product products}) {
    return MaterialPageRoute(
        settings:const RouteSettings(name : routeName) ,
        builder: (_)=> ProductScreen(product: products));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: product.name),
      bottomNavigationBar:BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.share,color: Colors.white,)),
              BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(onPressed: () {
                context.read<WishlistBloc>().add(AddWishlist(product));
                const snackBar = SnackBar(content: Text('Added to Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, icon: const Icon(Icons.favorite,color: Colors.white));

  },
),
              BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){
                    context.read<CartBloc>().add(CartAdded(product));
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Text('ADD TO CART',style: Theme.of(context).textTheme.displaySmall,));
  },
),
            ],
          ),
        ),
      ),
      body:  ListView(
        children: [
          CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: [HeroCarousalCard(product: product,)],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                width: MediaQuery.of(context).size.width - 50,
                height: 50.0,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                      Text('\$${product.price}',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text('Product Information',style: Theme.of(context).textTheme.displaySmall),
              children:  [
                ListTile(
                  title: Text('data',
                    style : Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Delivery Information',style: Theme.of(context).textTheme.displaySmall),
              children:  [
                ListTile(
                  title: Text('data',
                    style : Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

