
import 'package:flutter/material.dart';
import 'package:shoppreal/model/product.dart';
import 'package:shoppreal/widgets/producttile.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
   const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductTile(
                    product: products[index],
                  ),
                ))),
      ),
    );
  }
}
