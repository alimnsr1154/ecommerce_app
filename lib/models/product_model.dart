import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  late final String id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String category;
  @HiveField(3)
  late final String image_url;
  @HiveField(4)
  late final double price;
  @HiveField(5)
  late final bool isRecommended;
  @HiveField(6)
  late final bool isPopular;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image_url,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        id : snap['id'],
        name: snap['name'],
        category: snap['category'],
        image_url: snap['image_url'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }

  static List<Product> products = [
    Product(
        id : '0',
        name: 'Soft Drink #1',
        category: 'Soft Drinks',
        image_url: 'assets/images/coke.jpg',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    Product(
        id : '1',
        name: 'Smoothie #1',
        category: 'Smoothies',
        image_url: 'assets/images/blueberry_smoothie.jpeg',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
    Product(
        id : '2',
        name: 'Soft Drink #2',
        category: 'Soft Drinks',
        image_url: 'assets/images/sprite.jpg',
        price: 2.99,
        isRecommended: true,
        isPopular: true),
    Product(
        id : '3',
        name: 'Smoothie #2',
        category: 'Smoothies',
        image_url: 'assets/images/chocolate_smoothie.jpg',
        price: 2.99,
        isRecommended: false,
        isPopular: false),
    Product(
        id : '4',
        name: 'Soft Drink #3',
        category: 'Soft Drinks',
        image_url: 'assets/images/dew.jpg',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    Product(
        id : '5',
        name: 'Smoothie #3',
        category: 'Smoothies',
        image_url: 'assets/images/strawberry_smoothie.jpeg',
        price: 2.99,
        isRecommended: false,
        isPopular: true),
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id,name, category, image_url, price, isRecommended, isPopular];
}
