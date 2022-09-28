import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/domain/repository/custom_exception.dart';
import 'package:finder_seller/domain/repository/product_repository.dart';
import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productListExceptionProvider =
    StateProvider<CustomException?>((_) => null);

final productListControllerProvider =
    StateNotifierProvider<ProductListController, AsyncValue<List<Product>>>(
        (ref) {
  final user = ref.watch(authControllerProvider);
  return ProductListController(ref.read, user?.uid);
});

class ProductListController extends StateNotifier<AsyncValue<List<Product>>> {
  // _read to _reader
  final Reader _reader;
  final String? _userId;

  ProductListController(this._reader, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId != null) {
      retrieveProducts();
    }
  }

  Future<void> retrieveProducts({bool isRefreshing = false}) async {
    try {
      final products = await _reader(productRepositoryProvider)
          .retrieveProducts(userId: _userId!);
      if (mounted) {
        state = AsyncValue.data(products);
      }
    } on CustomException catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace: stackTrace);
    }
  }

  Future<void> addProduct(
      {required String name,
      String? imagePath,
      required int regularPrice,
      required int discountRate,
      String? productDetail}) async {
    try {
      final product = Product(
          name: name,
          imagePath: imagePath,
          regularPrice: regularPrice,
          discountRate: discountRate,
          productDetail: productDetail,
          isExhibited: true,
      );
      final productId = await _reader(productRepositoryProvider)
          .addProduct(userId: _userId!, product: product);
      state.whenData((products) => state =
          AsyncValue.data(products..add(product.copyWith(id: productId))));
    } on CustomException catch (e) {
      _reader(productListExceptionProvider.state).state = e;
    }
  }

  Future<void> updateProduct({required Product updateProduct}) async {
    try {
      await _reader(productRepositoryProvider)
          .updateProduct(userId: _userId!, product: updateProduct);
      state.whenData((products) {
        state = AsyncValue.data([
          for (final product in products)
            if (product.id == updateProduct.id) updateProduct else product
        ]);
      });
    } on CustomException catch (e) {
      _reader(productListExceptionProvider.state).state = e;
    }
  }

  Future<void> toggleIsExhibited({required Product toggleProduct}) async {
    try {
      await _reader(productRepositoryProvider).updateProduct(userId: _userId!, product: toggleProduct);
      state.whenData((products) {
        state = AsyncValue.data([
          for (final product in products)
            if (product.id == toggleProduct.id) toggleProduct else product
        ]);
      });
    } on CustomException catch (e) {
      _reader(productListExceptionProvider.state).state = e;
    }
  }

  Future<void> deleteProduct({required String productId}) async {
    try {
      await _reader(productRepositoryProvider)
          .deleteProduct(userId: _userId!, productId: productId);
      state.whenData((products) {
        state = AsyncValue.data(
            products..removeWhere((product) => product.id == productId));
      });
    } on CustomException catch (e) {
      _reader(productListExceptionProvider.state).state = e;
    }
  }
}
