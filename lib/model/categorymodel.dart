import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Categoryy extends Equatable {
  final String name;
  final String imagurl;

  const Categoryy({required this.name, required this.imagurl});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imagurl];
  static Categoryy fromSnapshot(DocumentSnapshot snapshot) {
    Categoryy categoryy =
        Categoryy(name: snapshot['name'], imagurl: snapshot['imagurl']);
    return categoryy;
  }

  static List<Categoryy> categories = [
    const Categoryy(
        name: "nike",
        imagurl:
            "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
    const Categoryy(
        name: 'addidas',
        imagurl:
            "https://images.unsplash.com/photo-1518002171953-a080ee817e1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
    const Categoryy(
        name: "N",
        imagurl:
            'https://images.unsplash.com/photo-1539185441755-769473a23570?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80'),
  ];
}
