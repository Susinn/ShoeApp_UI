import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../model/product.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            product.imageUrl,
            height: 100,
            width: 130,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(product.name),
              const SizedBox(
                height: 30,
              ),
              Text('\$${product.price}')
            ],
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: (() {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));
                        }),
                        icon: const Icon(Icons.add_circle)),
                    Text(quantity.toString()),
                    IconButton(
                        onPressed: (() {
                          context
                              .read<CartBloc>()
                              .add(CartProductRemoved(product));
                        }),
                        icon: const Icon(Icons.remove_circle))
                  ],
                );
              } else {
                return Text("something wennt wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
