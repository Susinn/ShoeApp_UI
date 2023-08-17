// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import '../../model/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName), builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "WAlKSHOE"),
      bottomNavigationBar: const Cstmappbar(currentPageRoute: routeName,),
      body: Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 0.8, enlargeCenterPage: true),
              items: Categoryy.categories
                  .map((Categoryy) => CaresoulCard(categoryy: Categoryy))
                  .toList()),
          const SizedBox(
            height: 10,
          ),
          const Titlewidget(title: 'Recomended'),
          const SizedBox(
            height: 20,
          ),
          ProductCarousel(products:Product.products ),
         const  SizedBox(
            height: 30,
          ),
         const  Titlewidget(title: 'Most  popular'),
       
         ProductCarousel(products: Product.products.where((Product) => Product.isRecommended).toList())
        
        ],
      ),
    );
  }
}
