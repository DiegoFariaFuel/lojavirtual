
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojaagir/Blocs/Cart/cart_bloc.dart';
import 'package:lojaagir/Blocs/Cart/cart_event.dart';
import 'package:lojaagir/Blocs/Category/category_bloc.dart';
import 'package:lojaagir/Blocs/Category/category_event.dart';
import 'package:lojaagir/Blocs/Product/product_bloc.dart';
import 'package:lojaagir/Blocs/Product/product_event.dart';

import 'Blocs/wishlist/wishlist_bloc.dart';
import 'Pages/SplashScreen/splash_screen.dart';
import 'Repository/Category/category_repository.dart';
import 'Repository/Product/product_repository.dart';
import 'Rotas/app_router.dart';
import 'Rotas/theme.dart';
import 'blocs/wishlist/wishlist_event.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
          create: (_) => WishlistBloc()..add(StartWishList()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories()),
        ),
                BlocProvider<ProductBloc>(
          create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProduct()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        //HomeScreen.routeName,

        //home: const HomeScreen(),

        title: 'agir Store',
        theme: theme(),
      ),
    );
  }
}
