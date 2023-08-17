part of 'whishlist_bloc.dart';

abstract class WhishlistState extends Equatable {
  const WhishlistState();

  @override
  List<Object> get props => [];
}

class WhishlistLoading extends WhishlistState {}

class WhishlistLoaded extends WhishlistState {
  final Wishlist whishlistt;

  const WhishlistLoaded({this.whishlistt = const Wishlist()});
  @override
  List<Object> get props => [whishlistt];
}

class WhishlistError extends WhishlistState {}
