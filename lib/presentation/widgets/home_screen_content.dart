import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreenContent extends HookConsumerWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    return SingleChildScrollView(
      child: Center(
          child: Column(
            children: [
              Text("List of Products whose propathi 'isExhibited' is true"),
              // ElevatedButton(
              //     onPressed: () async {
              //       await authControllerProviderNotifier.signOut();
              //     },
              //     child: Text("SignOut")),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  productListState.when(
                    data: (products) => products.isEmpty
                        ? const Center(
                      child: Text("Products is empty"),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = products[index];
                        return product.isExhibited
                            ? Container(
                          key: ValueKey(product.id),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: product.imagePath.toString(),
                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress),
                              ),
                              Text(product.name),
                              Text(product.productDetail.toString()),
                              Text("${product.regularPrice}円"),
                              Text("${product.discountRate}"),
                              // ElevatedButton(
                              //     onPressed: () {
                              //       ref
                              //           .watch(productListControllerProvider
                              //           .notifier)
                              //           .deleteProduct(
                              //           productId: product.id!);
                              //     },
                              //     child: Text("Delete")),
                              // ElevatedButton(
                              //     onPressed: () {
                              //       ref
                              //           .watch(productListControllerProvider
                              //           .notifier)
                              //           .updateProduct(
                              //           updateProduct: product.copyWith(
                              //               name: "手作り弁当",
                              //               productDetail: "Hi"));
                              //     },
                              //     child: Text("Edit"))
                              ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .watch(
                                        productListControllerProvider
                                            .notifier)
                                        .updateProduct(
                                        updateProduct:
                                        product.copyWith(
                                            isExhibited: !product
                                                .isExhibited));
                                  },
                                  child: Text("投稿中止"))
                            ],
                          ),
                        )
                            : Text("表示中の商品はありません");
                      },
                    ),
                    error: (error, _) => Text("エラー"),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}
