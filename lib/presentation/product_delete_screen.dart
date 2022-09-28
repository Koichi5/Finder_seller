import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDeleteScreen extends HookConsumerWidget {
  const ProductDeleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    // final authControllerProviderNotifier = ref.watch(authControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("product delete screen"),
      ),
      //body consists of list of product that is on exhibition.
      //This page should be a part of [page view] controlled by segmented buttons
      // may have to remove scaffold and replace that with just a Widget
      body: Center(
        child: Column(
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
                    return product.isExhibited ? Container(
                      key: ValueKey(product.id),
                      child: Column(
                        children: [
                          Text(product.name),
                          Image.network(product.imagePath.toString()),
                          Text(product.productDetail.toString()),
                          Text("${product.regularPrice}円"),
                          Text("${product.discountRate}%"),
                          ElevatedButton(
                            onPressed: (){
                              ref.watch(productListControllerProvider.notifier).updateProduct(updateProduct: product.copyWith(isExhibited: !product.isExhibited));
                            },
                            child: Text("投稿中止"))
                        ],
                      ),
                    ) : Text("表示中の商品はありません");
                  },
                ),
                error: (error, _) => Text("エラー"),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ))
          ],
        ),
      ),
    );
  }
}
