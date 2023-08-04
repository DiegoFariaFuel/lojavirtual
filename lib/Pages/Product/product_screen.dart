
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojaagir/Blocs/Cart/cart_bloc.dart';
import 'package:lojaagir/Blocs/Cart/cart_event.dart';
import 'package:lojaagir/Blocs/Cart/cart_state.dart';
import 'package:lojaagir/Blocs/wishlist/wishlist_bloc.dart';
import 'package:lojaagir/Blocs/wishlist/wishlist_event.dart';
import 'package:lojaagir/Blocs/wishlist/wishlist_state.dart';

import '../../Models/product_model.dart';
import '../CustomWidget/custom_appbar.dart';
import '../CustomWidget/hero_carousel.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: product,
            ));
  }

  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddWishListProduct(product));
                    // ignore: prefer_const_constructors
                    final snackbar = SnackBar(
                        content: const Text('Adicionado aos Favoritos com sucesso!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                );
              }),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {context.read()<CartBloc>().add(CartProductAdded(product));
                      Navigator.pushNamed(context, '/Carrinho');},
                      child: Text(
                        'Adicionar ao Carrinho',
                        style: Theme.of(context).textTheme.displaySmall,
                      ));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              initialPage: 0,
              autoPlay: false,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.black.withAlpha(50),
                  alignment: Alignment.center,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Detalhes do produto',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Aqui fica a descricão do produto!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              title: Text(
                'Informações de Entrega',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Aqui fica a descricão da Entrega!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
