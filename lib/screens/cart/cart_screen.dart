import 'package:ecom/bloc/cart/cart_bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings:RouteSettings(name : routeName) ,
        builder: (_)=> CartScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Cart Screen'),
      bottomNavigationBar:BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){},
                  child: Text('GO TO CHECKOUT',style: Theme.of(context).textTheme.displaySmall,))
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoading)
    return Center(
        child: CircularProgressIndicator(),
      );
    if(state is CartLoaded)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(const Cart().freeDeliveryString,
                            style: Theme.of(context).textTheme.bodySmall),
                        ElevatedButton(onPressed: () {
                          Navigator.pushNamed(context, '/');
                        }, style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                        ),child: Text('Add more items',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                        ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 340,
                      child: ListView.builder(
                        itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                        itemBuilder: (context,index){
                          return CartProductCard(
                              product:state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                              quantity : state.cart.productQuantity(state.cart.products).values.elementAt(index));
                        },
                      ),
                    ),
                    const SizedBox(height: 10,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Divider(thickness: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SUBTOTAL',style: Theme.of(context).textTheme.bodyLarge,),
                            Text('\$${state.cart.subtotalString}',style: Theme.of(context).textTheme.bodyLarge,),

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('DELIVERY FEE',style: Theme.of(context).textTheme.bodyLarge,),
                            Text('\$${state.cart.deliveryfeeString}',style: Theme.of(context).textTheme.bodyLarge,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(50),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(5.0),
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                              Text('\$${state.cart.totalString}',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),

            ],
          ),
        );
      }
    else{
      return const Text('Something went wrong');
    }
  },
)
    );
  }
}
