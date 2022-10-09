import 'package:finder_seller/presentation/widgets/exhibited_product_card.dart';
import 'package:finder_seller/presentation/widgets/home_screen_product_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/product_list_controller.dart';

class HomeScreenProductList extends HookConsumerWidget {
  const HomeScreenProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          productListState.when(
              data: (products) => products.isEmpty
                  ? const Center(
                child: Text("出品中の商品はありません"),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return product.isExhibited
                      ? HomeScreenProductCard(product)
                  //     ? Container(
                  //   key: ValueKey(product.id),
                  //   child: Column(
                  //     children: [
                  //       Text(product.name),
                  //       Image.network(
                  //           product.imagePath.toString()),
                  //       Text(product.productDetail.toString()),
                  //       Text("${product.regularPrice}円"),
                  //       Text("${product.discountRate}%"),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             ref
                  //                 .watch(
                  //                 productListControllerProvider
                  //                     .notifier)
                  //                 .updateProduct(
                  //                 updateProduct:
                  //                 product.copyWith(
                  //                     isExhibited: !product
                  //                         .isExhibited));
                  //           },
                  //           child: const Text("投稿中止"))
                  //     ],
                  //   ),
                  // )
                      : const SizedBox();
                },
              ),
              error: (error, _) => const Text("エラー"),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ))
        ],
      ),
    );
  }
}