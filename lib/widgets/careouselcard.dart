import 'package:flutter/material.dart';

import '../model/categorymodel.dart';

class CaresoulCard extends StatelessWidget {
  final Categoryy categoryy;
  const CaresoulCard({Key? key, required this.categoryy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalog',arguments: categoryy );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 3),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(categoryy.imagurl,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      categoryy.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
