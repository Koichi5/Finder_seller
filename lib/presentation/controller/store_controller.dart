import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/domain/repository/custom_exception.dart';
import 'package:finder_seller/domain/repository/store_repository.dart';
import 'package:finder_seller/domain/store.dart';
import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storeListExceptionProvider = StateProvider<CustomException?>((_) => null);

final storeListControllerProvider =
    StateNotifierProvider<StoreListController, AsyncValue<List<Store>>>((ref) {
  final user = ref.watch(authControllerProvider);
  return StoreListController(ref.read, user?.uid);
});

class StoreListController extends StateNotifier<AsyncValue<List<Store>>> {
  // _read to _reader
  final Reader _reader;
  final String? _userId;

  StoreListController(this._reader, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveStores();
    }
  }

  Future<void> retrieveStores({bool isRefreshing = false}) async {
    try {
      final stores = await _reader(storeRepositoryProvider)
          .retrieveStores(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(stores);
      }
    } on CustomException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace: stackTrace);
    }
  }

  Future<void> addStore({
    required String name,
    required bool isSuperMarket,
    required int postCode,
    required String address,
    required String? phoneNumber,
    required String genre,
    String? imagePath,
  }) async {
    try {
      final store = Store(
        name: name,
        imagePath: imagePath,
        isSuperMarket: isSuperMarket,
        postCode: postCode,
        address: address,
        phoneNumber: phoneNumber,
        genre: genre,
      );
      final storeId = await _reader(storeRepositoryProvider)
          .addStore(userId: _userId!, store: store);
      state.whenData((stores) => state =
          AsyncValue.data(stores..add(store.copyWith(id: storeId))));
    } on CustomException catch (e) {
      _reader(storeListExceptionProvider.state).state = e;
    }
  }

  Future<void> updateStore({required Store updateStore}) async {
    try {
      await _reader(storeRepositoryProvider)
          .updateStore(userId: _userId!, store: updateStore);
      state.whenData((stores) {
        state = AsyncValue.data([
          for (final store in stores)
            if (store.id == updateStore.id) updateStore else store
        ]);
      });
    } on CustomException catch (e) {
      _reader(storeListExceptionProvider.state).state = e;
    }
  }

  Future<void> deleteStore({required String storeId}) async {
    try {
      await _reader(storeRepositoryProvider)
          .deleteStore(userId: _userId!, storeId: storeId);
      state.whenData((stores) {
        state = AsyncValue.data(
            stores..removeWhere((store) => store.id == storeId));
      });
    } on CustomException catch (e) {
      _reader(storeListExceptionProvider.state).state = e;
    }
  }
}
