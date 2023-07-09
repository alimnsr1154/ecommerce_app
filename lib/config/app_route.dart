import 'package:ecom/models/models.dart';
import 'package:ecom/screens/screens.dart';
import 'package:flutter/material.dart';
class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is a route ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case SplashScreen.routeName:
        return SplashScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(products: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderConfirmaton.routeName:
        return OrderConfirmaton.route();
      case PaymentScreen.routeName:
        return PaymentScreen.route();
      case StartScreen.routeName:
        return StartScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      default:
        return _error();
    }
  }

  static Route _error() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ));
  }
}
