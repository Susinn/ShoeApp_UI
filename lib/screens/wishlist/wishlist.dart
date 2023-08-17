import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoppreal/widgets/coustomappbar.dart';

import '../../blocs/whislist/whishlist_bloc.dart';
import '../../widgets/cstmappbar.dart';
import '../../widgets/producttile.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "WishlistScreen"),
      bottomNavigationBar: const Cstmappbar(currentPageRoute: routeName,),
      body: BlocBuilder<WhishlistBloc, WhishlistState>(
        builder: (context, state) {
          if (state is WhishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is WhishlistLoaded ){
          return GridView.builder(
              itemCount:state.whishlistt.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 1),
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      widthFactor: 1.1,
                      child: ProductTile(
                        product: state.whishlistt.products[index]
                        ),
                    ),
                  )));
          }else {
            return const Text("SOMETHING WENT WRONG");
            }
        }
      ),
    );
  }
}
