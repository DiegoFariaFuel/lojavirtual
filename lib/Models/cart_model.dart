
import 'package:equatable/equatable.dart';
import 'package:lojaagir/Models/product_model.dart';

class Cart extends Equatable{
  final List <Product> products;
  const Cart({this.products = const <Product> []});


Map productQuantity(products){
  // ignore: prefer_collection_literals
  var quantity = Map();

  products.forEach((product){if(!quantity.containsKey(product)){
    quantity[product]=1;
  }else{quantity[product]+=1;}});
  return quantity;
}


double get subtotal => products.fold(0,(total,current)=> total + current.price);

double deliveryFree (subtotal)
{
  if(subtotal >= 30){
    return 60;
  }
  else {
    return 0;
  }
}

double total (subtotal , deliveryFree){
  return subtotal+deliveryFree(subtotal);
}

String freeDelivery (subtotal){
  if(subtotal >= 30){
    return 'Ganhou entrega gratis';

  }else{
    num missing = 30 - subtotal ;
    return ('Add R\$${missing.toStringAsFixed(2)} frete gratis!');
  }

}

String get subtotalString => subtotal.toStringAsFixed(2);
String get totalString => total (subtotal,deliveryFree).toStringAsFixed(2);
String get deliveryFreeString => deliveryFree(subtotal).toStringAsFixed(2);
String get freDeliveryString => freeDelivery(subtotal);


  @override

  List<Object?> get props => [products];

}