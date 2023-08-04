
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojaagir/Blocs/wishlist/wishlist_state.dart';

import '../../Models/wishllist_model.dart';
import '../../blocs/wishlist/wishlist_event.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
    WishlistBloc() : super(WishlistLoading()) {
    // Registra o manipulador para o evento StartWishList
    on<StartWishList>((event, emit) {
      // Adicione aqui a lógica para processar o evento StartWishList
      // Neste caso, estamos retornando o estado WishlistLoaded após um pequeno atraso simulado
      emit(const WishlistLoaded(wishlist: Wishlist()));
    });

    // Registra o manipulador para o evento AddWishListProduct
    on<AddWishListProduct>((event, emit) {
      // Adicione aqui a lógica para processar o evento AddWishListProduct
      // Neste caso, estamos atualizando a lista de desejos com o novo produto
      if (state is WishlistLoaded) {
        final updatedWishlist = Wishlist(
          products: List.from(state.wishlist.products)..add(event.product),
        );
        emit(WishlistLoaded(wishlist: updatedWishlist));
      }
    });
  }

  
  
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    // O método mapEventToState não precisa mais tratar o evento StartWishList ou AddWishListProduct,
    // pois eles já foram registrados no construtor do WishlistBloc
    if (event is RemoveWishListProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }


  // ignore: unused_element
  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded(wishlist: Wishlist());
    } catch (_) {}
  }

  // ignore: unused_element
  Stream<WishlistState> _mapAddWishlistProductToState(
      AddWishListProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
      RemoveWishListProduct event, WishlistState state) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}