import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistEvent>((event, emit) async* {
    if(event is StartWishlist) {
      yield* _mapStartWishlistProductToState();
    }
    else if(event is AddWishlist)
      {
        yield* _mapAddWishlistProductToState(event,state);
      }
    else if(event is RemoveWishlist)
    {
      yield* _mapRemoveWishlistProductToState(event,state);
    }
    });

  }


  Stream<WishlistState> _mapStartWishlistProductToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));

      yield const WishlistLoaded();
    }
    catch(_){
      print('Error occurred during WishlistLoading');
    }

  }

  Stream<WishlistState> _mapAddWishlistProductToState(AddWishlist event ,WishlistState state) async* {
    if(state is WishlistLoaded)
    {
      try{
        yield WishlistLoaded(wishList: Wishlist(products: List.from(state.wishList.products)..add(event.product),),);
      }
      catch(_){}

    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(RemoveWishlist event ,WishlistState state) async* {
    if(state is WishlistLoaded)
    {
      try{
        yield WishlistLoaded(wishList: Wishlist(products: List.from(state.wishList.products)..remove(event.product),),);
      }
      catch(_){}

    }
  }
}
