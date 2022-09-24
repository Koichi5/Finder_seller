import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product implements _$Product {
  const Product._();
  const factory Product({
    String? id,
    required String name,
    String? imagePath,
    int? regularPrice,
    int? discountRate,
    String? productDetail,
  }) = _Product;

  factory Product.empty() => const Product(name: '');

  factory Product.fromJson(json) => _$ProductFromJson(json);

  factory Product.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Product.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
