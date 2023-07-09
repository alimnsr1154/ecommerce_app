import 'package:ecom/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecom/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmaton extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  const OrderConfirmaton({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const OrderConfirmaton());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(title: 'Order Confirmation'),
      bottomNavigationBar: const Custom_nav_bar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset('assets/svgs/garlands.svg'),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your order is Complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ORDER NOW: #k321-ekd3',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thank you for purchasing on Zero To Unicorn',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const OrderSummary(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ORDER DETAILS',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCard(product: Product.products[0],quantity: 2,)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
