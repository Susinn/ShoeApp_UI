// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppreal/blocs/cart/cart_bloc.dart';

import 'package:shoppreal/model/product.dart';
import 'package:shoppreal/widgets/widgets.dart';

import '../../blocs/whislist/whishlist_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/Product';

  const ProductScreen({super.key, required this.product});

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => ProductScreen(
              product: product,
            ));
  }

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WhishlistBloc, WhishlistState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: (() {
                        context.read<WhishlistBloc>().add(AddWishlist(product));
                      }),
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ));
                },
              ),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CartLoaded) {
                  return ElevatedButton(
                      onPressed: (() {
                        context.read<CartBloc>().add(CartProductAdded(product));
                      }),
                      child: const Text("ADD TO CART"));
                } else {
                  return const Text('something went wrong');
                }
              }),
              ElevatedButton(onPressed: (() {}), child: const Text("BUY NOW"))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            color: Colors.black26,
            child: Row(
              children: [
                Titlewidget(title: product.name),
                const Spacer(),
                Text(
                  " \$${product.price * 2}",
                  style: const TextStyle(
                    color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
                Titlewidget(title: "\$${product.price}"),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              "Product information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text(
                  """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.""",
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
