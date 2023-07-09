import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_mapStartWishlistProductToState);
    on<AddWishlist>(_mapAddWishlistProductToState);
    on<RemoveWishlist>(_mapRemoveWishlistProductToState);
  }


  void _mapStartWishlistProductToState(StartWishlist event,
      Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded(
        wishList: Wishlist(),
      ));
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _mapAddWishlistProductToState(AddWishlist event,
      Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: Wishlist(
            products: List.from((state as WishlistLoaded).wishList.products)
              ..add(event.product),
          ),
        ));
      }
      on Exception {
        emit(WishlistError());
      }
    }
  }

  void _mapRemoveWishlistProductToState(RemoveWishlist event,
      Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: Wishlist(
            products: List.from((state as WishlistLoaded).wishList.products)
              ..remove(event.product),
          ),
        ));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}