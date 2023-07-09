part of 'wishlist_bloc.dart';
@immutable
abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class StartWishlist extends WishlistEvent{
  @override
  List<Object> get props => [];
}

class AddWishlist extends WishlistEvent {
  final Product product;
  const AddWishlist(this.product);

  @override

  List<Object> get props => [product];
}


class RemoveWishlist extends WishlistEvent {
  final Product product;
   const RemoveWishlist(this.product);

  @override
  List<Object> get props => [product];
}