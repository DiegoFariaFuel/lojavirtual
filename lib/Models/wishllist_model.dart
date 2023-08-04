
import 'package:equatable/equatable.dart';
import 'package:lojaagir/Models/product_model.dart';

import '../Blocs/wishlist/wishlist_event.dart';

class Wishlist extends Equatable{
  final List <Product> products;

  const Wishlist ({this.products = const <Product>[]});

  @override
  List <Object?> get props => [products];

  add(StartWishList startWishList) {}
}