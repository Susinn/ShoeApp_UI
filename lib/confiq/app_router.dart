import 'package:flutter/material.dart';
import 'package:shoppreal/model/categorymodel.dart';
import 'package:shoppreal/model/product.dart';
import 'package:shoppreal/screens/product/product.dart';
import 'package:shoppreal/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case SplashScreen.routeName:
        return SplashScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case Catalogscreen.routeName:
        return Catalogscreen.route(categoryy: settings.arguments as Categoryy);

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      case UserScreen.routeName:
        return UserScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('error'),
              ),
            ));
  }
}
