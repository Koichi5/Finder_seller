import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/domain/repository/custom_exception.dart';
import 'package:finder_seller/domain/repository/general_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseProductRepository {
  Future<List<Product>> retrieveProducts({required String userId});
  Future<String> addProduct({required String userId, required Product product});
  Future<void> updateProduct(
      {required String userId, required Product product});
  Future<void> toggleIsExhibited(
      {required String userId, required Product product});
  Future<void> deleteProduct(
      {required String userId, required String productId});
}

final productRepositoryProvider =
    Provider<ProductRepository>((ref) => ProductRepository(ref.read));

class ProductRepository implements BaseProductRepository {
  final Reader _read;

  ProductRepository(this._read);

  @override
  Future<List<Product>> retrieveProducts({required String userId}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          .get();
      return snap.docs.map((doc) => Product.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> addProduct(
      {required String userId, required Product product}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          .add(product.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateProduct(
      {required String userId, required Product product}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          .doc(product.id)
          .update(product.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> toggleIsExhibited({required String userId, required Product product}) async {
    try {
      await _read(firebaseFirestoreProvider).collection('seller').doc(userId).collection('productList').doc(product.id).update(product.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteProduct(
      {required String userId, required String productId}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('productList')
          .doc(productId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
