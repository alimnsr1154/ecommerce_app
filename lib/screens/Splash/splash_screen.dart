import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, '/start');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/shop.jpg'),
              radius: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Zero To Unicorn',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
