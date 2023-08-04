import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojaagir/Blocs/Product/product_event.dart';
import 'package:lojaagir/Blocs/Product/product_state.dart';

import '../../Repository/Product/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(ProductLoading()) {
    on<ProductEvent>((event, emit) {
      mapEventoState(event);
    });
  }

  Stream<ProductState> mapEventoState(ProductEvent event) async* {
    if (event is LoadProduct) {
      yield* _mapLoadProductToState();
    }
    if (event is UpdateProduct) {
      yield* _mapUpdateProductToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductToState() async* {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProduct().listen(
          (products) => add(
            UpdateProduct(products),
          ),
        );
  }

  Stream<ProductState> _mapUpdateProductToState(UpdateProduct event) async* {
    yield ProductLoaded(products: event.products);
  }
}
