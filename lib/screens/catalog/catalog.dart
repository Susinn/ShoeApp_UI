// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shoppreal/model/categorymodel.dart';
import 'package:shoppreal/model/product.dart';
import 'package:shoppreal/widgets/widgets.dart';


class Catalogscreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Categoryy categoryy}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => Catalogscreen(
              categoryy: categoryy,
            ));
  }


  final Categoryy categoryy;

  const Catalogscreen({
    Key? key,
    required this.categoryy,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryproduts = Product.products
        .where((product) => product.category == categoryy.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: categoryy.name),
      bottomNavigationBar: const Cstmappbar(currentPageRoute: routeName,),
      body: GridView.builder(
          itemCount: categoryproduts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 2),
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.all(18.0),
                child: ProductTile(product: categoryproduts[index]),
              ))),
    );
  }
}
