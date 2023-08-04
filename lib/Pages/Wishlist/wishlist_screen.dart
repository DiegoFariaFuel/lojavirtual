
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Blocs/wishlist/wishlist_bloc.dart';
import '../../Blocs/wishlist/wishlist_state.dart';
import '../CustomWidget/custom_appbar.dart';
import '../CustomWidget/custom_bottomappbar.dart';
import '../CustomWidget/product_card.dart';

class Wishlist extends StatelessWidget {
  static const String routeName = '/Wishlist';

  const Wishlist({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Wishlist(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Favoritos'),
      bottomNavigationBar: const CustomBottomBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WishlistLoaded) {
            if (state.wishlist.products.isEmpty) {
              // Mostra uma mensagem se a lista de desejos estiver vazia
              return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.heart_broken_sharp ,size: 40,),
                  SizedBox(height: 50,),
                  Text(
                    'Sua lista de desejos está vazia!',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                                  Text(
                    'Adicione produtos!',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ));
            } else {
              // Mostra a lista de produtos da lista de desejos
              return GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.6,
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishlist.products[index],
                      widthFactor: 1.09,
                      leftPosition: 135,
                      isWhishlist: true,
                    ),
                  );
                },
              );
            }
          } else {
            return const Text('Algo deu errado');
          }
        },
      ),
    );
  }
}
