import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../repositories/local_storage/local_storage_repository.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;
  WishlistBloc({required LocalStorageRepository localStorageRepository,}) :
        _localStorageRepository = localStorageRepository,
        super(WishlistLoading()) {
    on<StartWishlist>(_mapStartWishlistProductToState);
    on<AddWishlist>(_mapAddWishlistProductToState);
    on<RemoveWishlist>(_mapRemoveWishlistProductToState);
  }


  void _mapStartWishlistProductToState(StartWishlist event,
      Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Product> products = _localStorageRepository.getWishList(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishlistLoaded(
        wishList: Wishlist(products: products),
      ));
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _mapAddWishlistProductToState(AddWishlist event,
      Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToWishList(box, event.product);
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
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductToWishList(box, event.product);
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