import 'dart:io';

import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/domain/repository/custom_exception.dart';
import 'package:finder_seller/domain/repository/general_providers.dart';
import 'package:finder_seller/domain/repository/product_repository.dart';
import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
  File? imageFile;
  final ImagePicker picker = ImagePicker();

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
      required String? imagePath,
      // File? imageFile,
      required int regularPrice,
      required int discountRate,
      required int remainCount,
      String? productDetail}) async {
    try {
      final product = Product(
        name: name,
        imagePath: imagePath,
        // imageFile: imageFile,
        regularPrice: regularPrice,
        discountRate: discountRate,
        productDetail: productDetail,
        remainCount: remainCount,
        isExhibited: true,
        isReserved: false,
      );
      final productId = await _reader(productRepositoryProvider)
          .addProduct(userId: _userId!, product: product);
      state.whenData((products) => state =
          AsyncValue.data(products..add(product.copyWith(id: productId))));
      //
      // final doc = _reader(firebaseFirestoreProvider).collection('seller').doc(_userId).collection('productList').doc();
      //
      // if(imageFile != null) {
      //   String? imgURL;
      //   //  storage にアップロード
      //   final task = await FirebaseStorage.instance.ref("productList/${doc.id}").putFile(imageFile);
      //   // await _reader(firebaseFirestoreProvider)
      //   imgURL = await task.ref.getDownloadURL();
      // }
    } on CustomException catch (e) {
      _reader(productListExceptionProvider.state).state = e;
    }
  }

  // upload product image using image picker
  Future<String?> pickProductImage() async {
    String? imgURL;
    // Define image picker
    // This image picker's source is "gallery" not "camera" so i have to make function
    // to pick image from "camera".
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if pickedFile exists, define pickedFile's path as a variable "imageFile".
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    // In order to add imageFile path on Firebase, this code define which path to put image URL.
    final doc = _reader(firebaseFirestoreProvider)
        .collection('seller')
        .doc(_userId)
        .collection('productList')
        .doc();
    if (imageFile != null) {
      final task = await FirebaseStorage.instance
          .ref('productList/${doc.id}')
          .putFile(imageFile!);
      imgURL = await task.ref.getDownloadURL();
      // await _reader(firebaseFirestoreProvider).collection('seller').doc(_userId).collection('productList').doc().update(product);
      print(imgURL);
    }
    return imgURL;
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

  // Future<void> toggleIsExhibited({required Product toggleProduct}) async {
  //   try {
  //     await _reader(productRepositoryProvider).updateProduct(userId: _userId!, product: toggleProduct);
  //     state.whenData((products) {
  //       state = AsyncValue.data([
  //         for (final product in products)
  //           if (product.id == toggleProduct.id) toggleProduct else product
  //       ]);
  //     });
  //   } on CustomException catch (e) {
  //     _reader(productListExceptionProvider.state).state = e;
  //   }
  // }

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
