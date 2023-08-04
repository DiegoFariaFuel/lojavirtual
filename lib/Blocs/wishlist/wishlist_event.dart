
import 'package:equatable/equatable.dart';

import '../../Models/product_model.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistEvent {}

class AddWishListProduct extends WishlistEvent {
  final Product product;

  const AddWishListProduct(this.product);
  @override
  List<Object> get props => [];

}


class RemoveWishListProduct extends WishlistEvent {
  final Product product;

  const RemoveWishListProduct(this.product);
  @override
  List<Object> get props => [];

}
