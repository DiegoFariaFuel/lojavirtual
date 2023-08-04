
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
}

class ProductRepository implements BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    return _firebaseFirestore
        .collection('produtos')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
