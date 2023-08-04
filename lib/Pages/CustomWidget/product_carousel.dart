import 'package:flutter/material.dart';

import '../../Models/product_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product>products;
 
  const ProductCarousel({super.key, required this.products,
    
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
            shrinkWrap: true,
            padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ProductCard( product: products[index]),
              );
            }),
      ),
    );
  }
}