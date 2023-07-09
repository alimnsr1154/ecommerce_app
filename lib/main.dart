import 'package:ecom/bloc/bloc.dart';
import 'package:ecom/config/app_route.dart';
import 'package:ecom/config/theme.dart';
import 'package:ecom/models/models.dart';
import 'package:ecom/observer.dart';
import 'package:ecom/repositories/repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  initializeBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => WishlistBloc(
              localStorageRepository: LocalStorageRepository(),
            )..add(StartWishlist()),
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
      ),
    );
  }
}
