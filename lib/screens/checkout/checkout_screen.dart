import 'package:ecom/bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Custom_app_bar(title: 'Checkout Screen'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              if (state.paymentMethod == PaymentMethod.google_pay) {
                return GooglePay(
                  total: state.total!,
                  products: state.products!,
                );
              }
              if (state.paymentMethod == PaymentMethod.credit_card) {
                return const Text('Credit Card');
              }
              else {
                return const Text('Something went wrong');
              }
            }
            else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.black,
      //   child: SizedBox(
      //     height: 70,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         BlocBuilder<CheckoutBloc, CheckoutState>(
      //           builder: (context, state) {
      //             if (state is CheckoutLoading) {
      //               return const Center(
      //                 child: CircularProgressIndicator(),
      //               );
      //             }
      //             if (state is CheckoutLoaded) {
      //               return ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                       backgroundColor: Colors.white),
      //                   onPressed: () {
      //                     context
      //                         .read<CheckoutBloc>()
      //                         .add(ConfirmCheckout(checkout: state.checkout));
      //                     Navigator.pushNamed(context, '/order-confirmation');
      //                   },
      //                   child: Text(
      //                     'ORDER NOW',
      //                     style: Theme.of(context).textTheme.displaySmall,
      //                   ));
      //             } else {
      //               return const Text('Something went wrong');
      //             }
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall,
                  ),
                  CustomTextFormField(title: 'Email', onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  },
                  ),
                  CustomTextFormField(title: 'Full Name', onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  },
                  ),
                  CustomTextFormField(title: 'Address', onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  },
                  ),
                  CustomTextFormField(title: 'City', onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  },
                  ),
                  CustomTextFormField(title: 'Country', onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  },
                  ),
                  CustomTextFormField(title: 'ZipCode', onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  },
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/payment-selection',
                              );
                            },
                            child: Text(
                              'SELECT A PAYMENT METHOD',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/payment');
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ORDER SUMMARY',
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall,
                  ),
                  const OrderSummary(),
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
