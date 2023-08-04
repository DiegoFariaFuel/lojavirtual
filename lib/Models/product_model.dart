import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['nome'],
        category: snap['categoria'],
        imageUrl: snap['imagemUrl'],
        price: snap['preco'],
        isPopular: snap['isPopular'],
        isRecommended: snap['isRecommended']);
    return product;
  }

  static List<Product> product = [
    const Product(
        name: 'Macbook Pro',
        category: 'Informática',
        imageUrl:
            'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80',
        price: 2500,
        isPopular: true,
        isRecommended: true),
    const Product(
        name: 'Monitor',
        category: 'Informática',
        imageUrl:
            'https://images.unsplash.com/photo-1573285750682-05689540dfbc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80',
        price: 3000,
        isPopular: true,
        isRecommended: true),
    const Product(
        name: 'Cadeira',
        category: 'Mobiliário',
        imageUrl:
            'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
        price: 1500,
        isPopular: true,
        isRecommended: true),
  ];
}
