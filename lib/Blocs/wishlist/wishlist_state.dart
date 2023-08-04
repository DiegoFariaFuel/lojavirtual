
import 'package:equatable/equatable.dart';

import '../../Models/wishllist_model.dart';

abstract class WishlistState extends Equatable {
  const WishlistState ();

  Wishlist get wishlist => const Wishlist(); 
  @override
  List <Object> get props => [];

}

class WishlistLoading extends WishlistState {
  
}

class WishlistLoaded extends WishlistState {
  @override
  final Wishlist wishlist;
  
  const WishlistLoaded({this.wishlist = const Wishlist() });

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {}
