import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

// terminal code : flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class Product implements _$Product {
  const Product._();
  const factory Product({
    String? id,
    required String name,
    String? imagePath,
    // File? imageFile,
    required int? regularPrice,
    int? discountRate,
    String? productDetail,
    int? remainCount,
    @Default(false) bool isReserved,
    @Default(false) bool isExhibited,
  }) = _Product;

  factory Product.empty() => const Product(name: '', regularPrice: 0, discountRate: 0, remainCount: 0);

  factory Product.fromJson(json) => _$ProductFromJson(json);

  factory Product.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Product.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
