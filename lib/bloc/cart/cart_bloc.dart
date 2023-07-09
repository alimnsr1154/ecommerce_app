import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStartedToState);
    on<CartAdded>(_mapCartProductAddedToState);
    on<CartRemove>(_mapCartProductRemoveToState);
  }

  void _mapCartStartedToState(
      CartStarted event,Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    }
    catch (_) {}
  }

  void  _mapCartProductAddedToState(
      CartAdded event,Emitter<CartState> emit) async {
    if(state is CartLoaded) {
      try {
        emit(CartLoaded(
        cart: Cart(
          products: List.from((state as CartLoaded).cart.products)..add(event.product),
        )
      ));
    }
      on Exception {
        emit(CartError());
      }
    }
  }

  void  _mapCartProductRemoveToState(
      CartRemove event,Emitter<CartState> emit) async {
    if(state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..remove(event.product),
            )
        ));
      }
    on Exception {
        emit(CartError());
      }
    }
  }
}
