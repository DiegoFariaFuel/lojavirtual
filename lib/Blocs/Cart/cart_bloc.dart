
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_import
import '../../Models/cart_model.dart';

// ignore: unused_import
import '../../blocs/wishlist/wishlist_event.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
   // Registra o tratador (handler) para o evento CartStarted
    on<CartStarted>((event, emit) {
      emit(CartLoading()); // Emite o estado de loading
      // Aqui você pode implementar a lógica para carregar os itens do carrinho, se necessário
      // Por simplicidade, vamos apenas emitir CartLoaded imediatamente após o carregamento.
      emit(const CartLoaded(cart: Cart(products: [])));
    });

    // Registra o tratador (handler) para o evento CartProductAdded
    on<CartProductAdded>((event, emit) {
      // Adicione aqui a lógica para processar o evento CartProductAdded
      // Por exemplo, atualizar o carrinho com o novo produto
      if (state is CartLoaded) {
        final updatedCart = Cart(
          products: List.from((state as CartLoaded).cart.products)..add(event.product),
        );
        emit(CartLoaded(cart: updatedCart));
      }
    });

    // Registra o tratador (handler) para o evento CartProductRemove
    on<CartProductRemove>((event, emit) {
      // Adicione aqui a lógica para processar o evento CartProductRemove
      // Por exemplo, remover o produto do carrinho
      if (state is CartLoaded) {
        final updatedCart = Cart(
          products: List.from((state as CartLoaded).cart.products)..remove(event.product),
        );
        emit(CartLoaded(cart: updatedCart));
      }
    });




  }

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemove) {
      yield* _mapCartProductRemoveToState(event, state);
    }
  }

  Stream<CartState> _mapCartProductAddedToState(
      CartProductAdded event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        final updatedCart = Cart(
          products: List.from(state.cart.products)..add(event.product),
        );
        yield CartLoaded(cart: updatedCart);
      } catch (_) {
        // Em caso de erro, você pode emitir um estado de erro ou fazer outra coisa apropriada.
        yield CartError();
      }
    }
  }

  Stream<CartState> _mapCartProductRemoveToState(
      CartProductRemove event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
