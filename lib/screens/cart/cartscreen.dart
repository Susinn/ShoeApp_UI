import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppreal/model/cartmodel.dart';

import 'package:shoppreal/widgets/widgets.dart';

import '../../blocs/cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart"),
        bottomNavigationBar: const Cstmappbar(currentPageRoute: routeName,),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.cartModel
                                  .freeDelivery(state.cartModel.subtotal),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (() {
                              Navigator.of(context).pop();
                            }),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black45),
                            child: const Text("Add more"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 450,
                        child: ListView.builder(
                            itemCount: state.cartModel
                                .productQuantity(state.cartModel.products)
                                .keys
                                .length,
                            itemBuilder: ((context, index) => CartProductCard(
                                quantity: state.cartModel
                                    .productQuantity(state.cartModel.products)
                                    .values
                                    .elementAt(index),
                                product: state.cartModel
                                    .productQuantity(state.cartModel.products)
                                    .keys
                                    .elementAt(index)))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Divider(
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Sub Total :"),
                            Text(state.cartModel.subtotalstring)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Delivery Fee :"),
                            Text(const CartModel()
                                .delivery(state.cartModel.subtotal)
                                .toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total:"),
                                Text(state.cartModel.totalstring),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text("Something Went Wrong!");
            }
          },
        ));
  }
}
