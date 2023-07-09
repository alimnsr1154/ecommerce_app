import 'package:ecom/bloc/bloc.dart';
import 'package:ecom/config/app_route.dart';
import 'package:ecom/config/theme.dart';
import 'package:ecom/observer.dart';
import 'package:ecom/repositories/category/category_repository.dart';
import 'package:ecom/repositories/checkout/checkout_repository.dart';
import 'package:ecom/repositories/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishlist()),
          lazy: false,
        ),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => PaymentBloc()..add(LoadPaymentMethod())),

        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                checkoutRepository: CheckoutRepository(),
                cartBloc: context.read<CartBloc>(),
            paymentBloc: context.read<PaymentBloc>())),
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
