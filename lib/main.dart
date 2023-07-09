import 'package:ecom/bloc/wishlist_bloc.dart';
import 'package:ecom/config/app_route.dart';
import 'package:ecom/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: theme(),
        home: HomeScreen(),
      ),
    );
  }
}

