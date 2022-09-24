// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String?,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String?,
      regularPrice: json['regularPrice'] as int?,
      discountRate: json['discountRate'] as int?,
      productDetail: json['productDetail'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'regularPrice': instance.regularPrice,
      'discountRate': instance.discountRate,
      'productDetail': instance.productDetail,
    };
