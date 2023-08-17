import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];
  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
        name: snapshot['name'],
        category: snapshot['category'],
        imageUrl: snapshot['imageUrl'],
        price: snapshot['price'],
        isRecommended: snapshot['isRecommended'],
        isPopular: snapshot['isPopular']);
    return product;
  }

  static List<Product> products = [
    const Product(
        name: "adidas white",
        category: "addidas",
        imageUrl:
            'https://images.unsplash.com/photo-1558191053-c03db2757e3d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 3500,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: "N pink",
        category: "N",
        imageUrl:
            'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2224&q=80',
        price: 4900,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "adidass pro",
        category: "addidas",
        imageUrl:
            'https://images.unsplash.com/photo-1518894781321-630e638d0742?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
        price: 10300,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "nike jordan",
        category: "nike",
        imageUrl:
            'https://images.unsplash.com/photo-1512374382149-233c42b6a83b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 3500,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: "addidas white",
        category: "addidas",
        imageUrl:
            'https://images.unsplash.com/photo-1551116198-01d550c9809c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=792&q=80',
        price: 5900,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "nike air",
        category: "nike",
        imageUrl:
            'https://images.unsplash.com/photo-1514989940723-e8e51635b782?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 3500,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: "N X-20 ",
        category: "N",
        imageUrl:
            'https://images.unsplash.com/photo-1465453869711-7e174808ace9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2076&q=80',
        price: 9850,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: "addidas classic",
        category: "addidas",
        imageUrl:
            'https://images.unsplash.com/photo-1518002171953-a080ee817e1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 11000,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: "Nike black",
        category: "nike",
        imageUrl:
            'https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80',
        price: 15000,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: "N  classic",
        category: "N",
        imageUrl:
            'https://images.unsplash.com/photo-1539185441755-769473a23570?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80',
        price: 4000,
        isRecommended: false,
        isPopular: false),
    const Product(
        name: 'nike clasic',
        category: 'nike',
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        price: 7600,
        isRecommended: false,
        isPopular: false),
        const Product(
        name: 'nike brown',
        category: 'nike',
        imageUrl:
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2912&q=80',
        price: 9500,
        isRecommended: false,
        isPopular: false),
         const Product(
        name: 'nike black',
        category: 'nike',
        imageUrl:
            'https://images.unsplash.com/photo-1491553895911-0055eca6402d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80',
        price: 9500,
        isRecommended: false,
        isPopular: false),
         const Product(
        name: 'N Style',
        category: 'N',
        imageUrl:
            'https://images.unsplash.com/photo-1603808033192-082d6919d3e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=830&q=80',
        price: 4500,
        isRecommended: false,
        isPopular: false),
         const Product(
        name: 'nike jof',
        category: 'nike',
        imageUrl:
            'https://images.unsplash.com/photo-1605408499391-6368c628ef42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        price: 8600,
        isRecommended: false,
        isPopular: false),
  ];
}
