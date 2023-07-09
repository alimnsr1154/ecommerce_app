import 'package:ecom/screens/screens.dart';
import 'package:flutter/material.dart';
class AppRouter{

  static Route onGenerateRoute(RouteSettings settings){
    print('this is a route ${settings.name}');
    switch(settings.name) {
      case '/':
          return HomeScreen.route();
      case CartScreen.routeName :
        return CartScreen.route();
      case CatalogScreen.routeName :
        return CatalogScreen.route();
      case ProductScreen.routeName :
        return ProductScreen.route();
      case WishlistScreen.routeName :
        return WishlistScreen.route();
      default :
        return _error();
    }
}
  static Route _error(){
    return MaterialPageRoute(
        settings:const RouteSettings(name : '/error') ,
        builder: (_)=>Scaffold(appBar: AppBar(title: const Text('Error'),),));
  }

}