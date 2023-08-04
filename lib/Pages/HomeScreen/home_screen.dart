
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Blocs/Product/product_bloc.dart';
import '../../Blocs/Product/product_state.dart';
import '../CustomWidget/custom_appbar.dart';
import '../CustomWidget/custom_bottomappbar.dart';
import '../CustomWidget/hero_carousel.dart';
import '../CustomWidget/product_carousel.dart';
import '../CustomWidget/section_title.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'agir Store'),
        bottomNavigationBar: const CustomBottomBar(),
        body: Column(
          children: [
            const CardCarrouselCustom(),
            const SectionTitle(title: 'Recomendados'),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if(state is ProductLoaded){ return ProductCarousel(
                    products: state.products
                        .where((product) => product.isRecommended)
                        .toList());}
                else {return const Text('Algo de errado em home_screen bloc1');}
              },
            ),
            const SectionTitle(title: 'Mais Populares'),
                        BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if(state is ProductLoaded){ return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList());}
                else {return const Text('Algo de errado em home_screen bloc2');}
              },
            ),

          ],
        ));
  }
}
