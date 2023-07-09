import 'package:ecom/bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = '/payment';

  const PaymentScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const PaymentScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Custom_app_bar(title: 'Payment Selection'),
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
              else
                {
                  return const Text('Something went wrong');
                }
            }
            else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PaymentLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                RawGooglePayButton(
                  type: GooglePayButtonType.pay,
                  onPressed: () {
                    context.read<PaymentBloc>().add(const SelectPaymentMethod(
                        paymentMethod: PaymentMethod.google_pay));
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<PaymentBloc>().add(const SelectPaymentMethod(
                          paymentMethod: PaymentMethod.credit_card));
                      Navigator.pop(context);
                    },
                    child: const Text('Pay with Credit Card')),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
