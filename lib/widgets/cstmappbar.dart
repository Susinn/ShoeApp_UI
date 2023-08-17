import 'package:flutter/material.dart';

class Cstmappbar extends StatelessWidget {
  final String currentPageRoute;

  const Cstmappbar({
    Key? key,
    required this.currentPageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (currentPageRoute != '/') {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
            icon: const Icon(Icons.home),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              if (currentPageRoute != '/cart') {
                Navigator.pushReplacementNamed(context, '/cart');
              }
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              if (currentPageRoute != '/user') {
                Navigator.pushReplacementNamed(context, '/user');
              }
            },
            icon: const Icon(Icons.person),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
