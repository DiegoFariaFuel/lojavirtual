
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Blocs/Cart/cart_bloc.dart';
import '../../Blocs/Cart/cart_event.dart';
import '../../Blocs/Cart/cart_state.dart';
import '../../Models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWhishlist;

  const ProductCard(
      {super.key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 1,
      this.isWhishlist = false});

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 150,
            width: widthValue,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned(
          //top: 60,
          // left: leftPosition,
          //child: Container(
          // width: widthValue - leftPosition,
          // height: 80,
          //decoration: BoxDecoration(
          //color: Colors.black.withAlpha(50),
          //borderRadius: BorderRadius.circular(8)),
          // ),
          // ),
          Positioned(
            top: 70,
            left: leftPosition,
            child: Container(
              width: widthValue-3 - leftPosition,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'R\$ ${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                          child: IconButton(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(4),
                            onPressed: () {context.read<CartBloc>().add(CartProductAdded(product));},
                            color: Colors.white,
                            icon: const Icon(Icons.add_circle),
                          ),
                        );
                      }else {return const Text('Algo deu errado product_cart!');}
                      
                    },
                    
                  ),
                  isWhishlist
                      ? Expanded(
                          child: IconButton(
                            padding: const EdgeInsets.all(29),
                            onPressed: () {},
                            color: Colors.white,
                            icon: const Icon(Icons.delete),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
