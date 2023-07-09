import 'package:ecom/config/app_route.dart';
import 'package:ecom/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/screens.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: theme(),
      home: HomeScreen(),
    );
  }
}

