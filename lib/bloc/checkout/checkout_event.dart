part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;

  const UpdateCheckout(
      {this.fullName,
      this.email,
      this.city,
      this.zipCode,
      this.country,
      this.address,
      this.cart});

  @override
  List<Object?> get props => [
        fullName,
        email,
        city,
        zipCode,
        country,
        address,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
