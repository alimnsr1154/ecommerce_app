import 'package:ecom/models/models.dart';
import 'package:hive/hive.dart';

abstract class BaseLocalStorageRepository{
  Future<Box> openBox();
  List<Product> getWishList(Box box);
  Future<void> addProductToWishList(Box box,Product product);
  Future<void> removeProductToWishList(Box box,Product product);
  Future<void> clearWishList(Box box,Product product);


}