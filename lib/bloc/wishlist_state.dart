part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
}

class WishlistInitial extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WishlistLoaded extends WishlistState{
  final Wishlist wishList;
  const WishlistLoaded({this.wishList =  const Wishlist()});
  @override
  List<Object?> get props => [wishList];
}

class WishlistError extends WishlistState{
  @override
  List<Object?> get props => [];
}
