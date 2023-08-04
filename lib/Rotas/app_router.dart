

import 'package:flutter/material.dart';

import '../Models/catalogy_model.dart';
import '../Models/product_model.dart';
import '../Pages/Cart/screen_cart.dart';
import '../Pages/Catalog/catalog_screen.dart';
import '../Pages/CustomWidget/custom_bottomappbar.dart';
import '../Pages/HomeScreen/home_screen.dart';
import '../Pages/Product/product_screen.dart';
import '../Pages/SplashScreen/splash_screen.dart';
import '../Pages/Wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    
    // ignore: avoid_print
    print('Esta rota e : ${settings.name}');
    switch (settings.name) {

      case HomeScreen.routeName:
      return HomeScreen.route();
      
      case SplashScreen.routeName:
      return SplashScreen.route();
      
      case CardScreen.routeName:
      return CardScreen.route();  

      case ProductScreen.routeName:
      return ProductScreen.route(product: settings.arguments as Product);

      case Wishlist.routeName:
      return Wishlist.route();

      case CatalogScreen.routeName:
      return CatalogScreen.route(category:settings.arguments as Category);

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute<dynamic> _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        bottomNavigationBar: const CustomBottomBar(),
        appBar: AppBar(
          title: const Text('Erro'),
        ),
      ),
    );
  }
}
