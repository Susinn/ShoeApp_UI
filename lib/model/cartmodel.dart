// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:shoppreal/model/product.dart';

class CartModel extends Equatable {
  final List<Product> products;
  const CartModel({this.products = const <Product>[]});

  Map productQuantity(product) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal => products.fold(0.0, (t, current) => t + current.price);

  double delivery(subtotal) {
    if (subtotal == 0.0) {
      return 0.0;
    } else if (subtotal > 40000.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 40000) {
      return 'You have free delivery';
    } else {
      double missing = 40000.0 - subtotal;
      return "Add \$${missing.toStringAsFixed(0)} for free delivery";
    }
  }

  double total(subtotal, delivery) {
    return subtotal + delivery(subtotal);
  }

  String get totalstring => total(subtotal, delivery).toString();
  String get subtotalstring => subtotal.toString();

  @override
  List<Object?> get props => [products];
}
