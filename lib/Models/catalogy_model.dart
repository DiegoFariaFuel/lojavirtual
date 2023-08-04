import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

//utilizar dados do firebase da categoria

static Category fromSnapshot (DocumentSnapshot snap){
Category category = Category(name: snap['nome'], imageUrl: snap['imagemUrl']);
return category;
}




  static List<Category> categories = [
    const Category(
        name: 'Mobiliário',
        imageUrl:
            'https://images.unsplash.com/photo-1581539250439-c96689b516dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80'),
    const Category(
        name: 'Eletrodomésticos',
        imageUrl:
        'https://images.unsplash.com/photo-1657524520861-0b2690efc2b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'
            ),
    const Category(
        name: 'Informática',
        imageUrl:
        'https://images.unsplash.com/photo-1623251609314-97cc1f84e3ed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'
            ),
    const Category(
        name: 'Equipamento Médico',
        imageUrl:
        'https://images.unsplash.com/photo-1513224502586-d1e602410265?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1031&q=80'
            )        

  ];
}





