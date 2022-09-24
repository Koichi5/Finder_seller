// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  int? get regularPrice => throw _privateConstructorUsedError;
  int? get discountRate => throw _privateConstructorUsedError;
  String? get productDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String? imagePath,
      int? regularPrice,
      int? discountRate,
      String? productDetail});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imagePath = freezed,
    Object? regularPrice = freezed,
    Object? discountRate = freezed,
    Object? productDetail = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      regularPrice: regularPrice == freezed
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountRate: discountRate == freezed
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int?,
      productDetail: productDetail == freezed
          ? _value.productDetail
          : productDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String? imagePath,
      int? regularPrice,
      int? discountRate,
      String? productDetail});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, (v) => _then(v as _$_Product));

  @override
  _$_Product get _value => super._value as _$_Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imagePath = freezed,
    Object? regularPrice = freezed,
    Object? discountRate = freezed,
    Object? productDetail = freezed,
  }) {
    return _then(_$_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      regularPrice: regularPrice == freezed
          ? _value.regularPrice
          : regularPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountRate: discountRate == freezed
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int?,
      productDetail: productDetail == freezed
          ? _value.productDetail
          : productDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product extends _Product {
  const _$_Product(
      {this.id,
      required this.name,
      this.imagePath,
      this.regularPrice,
      this.discountRate,
      this.productDetail})
      : super._();

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? imagePath;
  @override
  final int? regularPrice;
  @override
  final int? discountRate;
  @override
  final String? productDetail;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, imagePath: $imagePath, regularPrice: $regularPrice, discountRate: $discountRate, productDetail: $productDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality()
                .equals(other.regularPrice, regularPrice) &&
            const DeepCollectionEquality()
                .equals(other.discountRate, discountRate) &&
            const DeepCollectionEquality()
                .equals(other.productDetail, productDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(regularPrice),
      const DeepCollectionEquality().hash(discountRate),
      const DeepCollectionEquality().hash(productDetail));

  @JsonKey(ignore: true)
  @override
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {final String? id,
      required final String name,
      final String? imagePath,
      final int? regularPrice,
      final int? discountRate,
      final String? productDetail}) = _$_Product;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get imagePath;
  @override
  int? get regularPrice;
  @override
  int? get discountRate;
  @override
  String? get productDetail;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
