import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/domain/repository/custom_exception.dart';
import 'package:finder_seller/domain/repository/general_providers.dart';
import 'package:finder_seller/domain/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseStoreRepository {
  Future<List<Store>> retrieveStores({required String userId});
  Future<String> addStore(
      {required String userId, required Store store});
  Future<void> updateStore(
      {required String userId, required Store store});
  Future<void> deleteStore(
      {required String userId, required String storeId});
}

final storeRepositoryProvider =
Provider<StoreRepository>((ref) => StoreRepository(ref.read));

class StoreRepository implements BaseStoreRepository {
  final Reader _read;

  StoreRepository(this._read);

  @override
  Future<List<Store>> retrieveStores({required String userId}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('store')
          .get();
      return snap.docs.map((doc) => Store.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<String> addStore(
      {required String userId, required Store store}) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('store')
          .add(store.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateStore(
      {required String userId, required Store store}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('store')
          .doc(store.id)
          .update(store.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteStore(
      {required String userId, required String storeId}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('seller')
          .doc(userId)
          .collection('store')
          .doc(storeId)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
