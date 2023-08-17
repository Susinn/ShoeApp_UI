
import 'package:flutter/material.dart';

class Titlewidget extends StatelessWidget {
  final String title;
  const Titlewidget({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          )),
    );
  }
}
