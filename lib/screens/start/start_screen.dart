import 'package:ecom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = '/start';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const StartScreen(),
    );
  }

  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(
        title: 'ZERO TO UNICORN',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              'Log In',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text(
              'Create an Account',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
