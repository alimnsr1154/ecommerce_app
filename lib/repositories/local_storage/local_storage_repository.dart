import 'package:ecom/models/product_model.dart';

import 'package:hive/hive.dart';

import 'base_local_storage_repository.dart';

class LocalStorageRepository extends BaseLocalStorageRepository{
  String boxName = 'wishlist_product';
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  List<Product> getWishList(Box box) {
    return box.values.toList() as List<Product>;
  }
  @override
  Future<void> addProductToWishList(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductToWishList(Box box, Product product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> clearWishList(Box box, Product product) async {
    await box.clear();
  }

}