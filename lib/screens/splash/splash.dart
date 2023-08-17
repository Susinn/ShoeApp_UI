import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/Splash';
  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () =>
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false));
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 200, 233),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/shoes.json'),
            const Text("WALKSHOE",style: TextStyle(fontSize: 30),)],
        ),
      ),
    );
  }
}
