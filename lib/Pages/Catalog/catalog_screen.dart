
import 'package:flutter/material.dart';
import '../../Models/catalogy_model.dart';
import '../../Models/product_model.dart';
import '../CustomWidget/custom_appbar.dart';
import '../CustomWidget/custom_bottomappbar.dart';
import '../CustomWidget/product_card.dart';

class CatalogScreen extends StatefulWidget {
  final Category category;
 
 //Se converter para state less assim funciona para filtrar categoria
   //CatalogScreen({super.key, required this.category}) 
   // : categoryProducts = Product.product 
     //   .where((product) => product.category == category.name)
      //  .toList();
      
      
  const CatalogScreen({super.key, required this.category});
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

   late List<Product> categoryProducts;

  @override
  void initState() {
    super.initState();
    categoryProducts = Product.product
        .where((product) => product.category == widget.category.name)
        .toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.category.name),
      bottomNavigationBar:  const CustomBottomBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ));
          }),
    );
  }
}
