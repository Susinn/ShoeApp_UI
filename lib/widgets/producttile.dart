import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppreal/model/product.dart';

import '../blocs/cart/cart_bloc.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Container(
              height: 50,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(171, 158, 158, 158),
              ),
              child: Column(
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.abyssinicaSil(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 5,),
                          Expanded(
                            flex: 2,
                            child: Text('\$${product.price}')),
                          BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartLoading) {
                                return const CircularProgressIndicator();
                              }
                              if (state is CartLoaded) {
                                return StreamBuilder<Object>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return Expanded(
                                      child: IconButton(onPressed: (){context.read<CartBloc>().add(
                                              CartProductAdded(
                                                  product));}, icon: const Icon(Icons.shopping_cart,size: 18,)),
                                    );
                                  }
                                );
                              } else {
                                return const Text("something went wrong");
                              }
                            },
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
