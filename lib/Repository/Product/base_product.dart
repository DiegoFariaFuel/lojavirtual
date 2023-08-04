

import '../../Models/product_model.dart';

abstract class BaseProductRepository {
  Stream <List<Product>> getAllProduct();

}