import 'package:ecom/models/models.dart';
import 'package:equatable/equatable.dart';


class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

   Map productQuantity(products){
     var quantity = {};
     products.forEach((products)
     {
      if(!quantity.containsKey(products))
        {
          quantity[products] = 1;
        }
      else
      {
        quantity[products] +=1;
      }
     });
     return quantity;
   }

  double get subtotal => products.fold(0, (previousValue, current) => previousValue + current.price);



  String freeDelivery(subtotal)
  {
    if(subtotal >= 30.0)
      {
        return 'You have Free Delivery';
      }
    else
      {
        double left = 30.0 - subtotal;
        return 'Add \$${left.toStringAsFixed(2)} for FREE Delivery';
      }
  }
  double deliveryFee(subtotal)
  {
    if(subtotal >= 30.0) {
      return 0;
    } else {
      return 10.0;
    }
  }
  double Total(subtotal,deliveryFee)
  {
    return subtotal + deliveryFee(subtotal);
  }
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryfeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get totalString => Total(subtotal, deliveryFee).toStringAsFixed(2);





}