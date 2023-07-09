import 'package:ecom/bloc/cart/cart_bloc.dart';
import 'package:ecom/bloc/wishlist/wishlist_bloc.dart';
import 'package:ecom/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class product_card extends StatelessWidget {
  final Product products;
  final double width;
  final bool isWishlist;
  final int? quantity;
  final bool isCart;
  final bool isSummary;
  final bool isCatalog;
  final double height;
  final Color iconColor;
  final Color fontColor;

  const product_card.catalog(
      {super.key,
      required this.products,
      this.width = 2.5,
      this.quantity,
      this.height = 150,
      this.isCatalog = true,
      this.isWishlist = false,
      this.isCart = false,
      this.isSummary = false,
      this.iconColor = Colors.white,
      this.fontColor = Colors.white});

  const product_card.cart(
      {super.key,
      required this.products,
      this.width = 2.5,
      this.quantity,
      this.height = 80,
      this.isCatalog = false,
      this.isWishlist = false,
      this.isCart = true,
      this.isSummary = false,
      this.iconColor = Colors.black,
      this.fontColor = Colors.black});

  const product_card.wishlist(
      {super.key,
      required this.products,
      this.width = 1,
      this.quantity,
      this.height = 150,
      this.isCatalog = false,
      this.isWishlist = true,
      this.isCart = false,
      this.isSummary = false,
      this.iconColor = Colors.white,
      this.fontColor = Colors.white});

  const product_card.summary(
      {super.key,
      required this.products,
      this.width = 1,
      this.quantity,
      this.height = 150,
      this.isCatalog = false,
      this.isWishlist = false,
      this.isCart = false,
      this.isSummary = true,
      this.iconColor = Colors.black,
      this.fontColor = Colors.black});

  const product_card({
    super.key,
    required this.products,
    this.width = 2.5,
    this.isWishlist = false,
    this.quantity,
    required this.isCart,
    required this.isSummary,
    required this.isCatalog,
    required this.height,
    required this.iconColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double adjWidth = wid / width;
    return InkWell(
      onTap: () {
        if (isCatalog || isWishlist) {
          Navigator.pushNamed(context, '/product', arguments: products);
        }
      },
      child: isCart || isSummary
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ProductImage(
                    adjWidth: 100,
                    products: products,
                    height: height,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ProductInformation(
                      products: products,
                      fontColor: fontColor,
                      isOrderSummary: isSummary ? true : false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ProductActions(
                      products: products,
                      isWishlist: isWishlist,
                      quantity: quantity,
                      iconColor: iconColor,
                      isCart: isCart,
                      isCatalog: isCatalog),
                ],
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ProductImage(
                  adjWidth: adjWidth,
                  products: products,
                  height: height,
                ),
                ProductBackground(
                    adjWidth: adjWidth,
                    widgets: [
                      ProductInformation(
                        products: products,
                        fontColor: fontColor,
                      ),
                      ProductActions(
                          products: products,
                          isWishlist: isWishlist,
                          quantity: quantity,
                          iconColor: iconColor,
                          isCart: isCart,
                          isCatalog: isCatalog),
                    ],
                ),
              ],
            ),
    );
  }
}

class ProductActions extends StatelessWidget {
  const ProductActions(
      {super.key,
      required this.products,
      required this.isWishlist,
      required this.quantity,
      required this.iconColor,
      required this.isCart,
      required this.isCatalog});

  final Product products;
  final bool isWishlist;
  final bool isCart;
  final bool isCatalog;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              IconButton addProduct = IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartAdded(products));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Center(child: Text('Added to Cart Successfully'))));
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: iconColor,
                  ));

              IconButton removeFromWishlist = IconButton(
                  onPressed: () {
                    context.read<WishlistBloc>().add(RemoveWishlist(products));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(child: Text('Remove from Wishlist'))));
                  },
                  icon: Icon(
                    Icons.delete,
                    color: iconColor,
                  ));
              IconButton removeProduct = IconButton(
                onPressed: () {
                  context.read<CartBloc>().add(CartRemove(products));
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: iconColor,
                ),
              );
              Text productQuantity = Text(
                quantity.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              );
              if (isCatalog) {
                return Row(
                  children: [addProduct],
                );
              }
              if (isCart) {
                return Row(
                  children: [
                    removeProduct,
                    productQuantity,
                    addProduct
                  ],
                );
              }
              if (isWishlist) {
                return Row(
                  children: [addProduct,removeFromWishlist],
                );
              } else {
                return const SizedBox();
              }
            } else {
              return const Text(
                'Something Went Wrong',
                style: TextStyle(fontSize: 2, color: Colors.white),
              );
            }
          },
        ),
      ],
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    super.key,
    required this.products,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  });

  final Product products;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              products.name,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: fontColor),
            ),
            Text(
              '\$${products.price}',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: fontColor),
            ),
          ],
        ),
        isOrderSummary
            ? Text(
                '\$$quantity',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: fontColor),
              )
            : const SizedBox(),
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.adjWidth,
    required this.products,
    required this.height,
  });

  final double adjWidth;
  final Product products;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adjWidth,
      height: height,
      child: Image.asset(
        products.image_url,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductBackground extends StatelessWidget {
   const ProductBackground(
      {super.key,
      required this.adjWidth,
      required this.widgets,
      });

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth,
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Container(
        width: adjWidth - 20,
        height: 55,
        margin: const EdgeInsets.only(bottom: 5,left: 5.0,right: 5.0,top: 5.0),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...widgets,
            ],
          ),
        ),
      ),
    );
  }
}
