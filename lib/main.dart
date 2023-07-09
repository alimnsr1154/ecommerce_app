import 'package:ecom/bloc/cart/cart_bloc.dart';
import 'package:ecom/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecom/config/app_route.dart';
import 'package:ecom/config/theme.dart';
import 'package:ecom/observer.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initializeBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: theme(),
      ),
    );
  }
}

