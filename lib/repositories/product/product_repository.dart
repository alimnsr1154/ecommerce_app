import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/models.dart';
import 'package:ecom/repositories/product/base_product_respository.dart';

class ProductRepository extends BaseProductRepository{
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}