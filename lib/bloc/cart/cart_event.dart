part of 'cart_bloc.dart';


abstract class CartEvent extends Equatable{
  const CartEvent();

}

class CartStarted extends CartEvent{
  @override
  List<Object> get props => [];
}

class CartAdded extends CartEvent{
  final Product product;
  const CartAdded(this.product);

  @override
  List<Object> get props => [product];
}

class CartRemove extends CartEvent{
  final Product product;
  const CartRemove(this.product);

  @override
  List<Object> get props => [product];
}