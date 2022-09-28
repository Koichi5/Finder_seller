import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductTemplateScreen extends HookConsumerWidget {
  const ProductTemplateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("product template screen"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("List of all products seller made"),
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
                      return Container(
                        key: ValueKey(product.id),
                        child: Column(
                          children: [
                            Text(product.name),
                            Image.network(product.imagePath.toString()),
                            Text(product.productDetail.toString()),
                            Text("${product.regularPrice}円"),
                            Text("${product.discountRate}"),
                            ElevatedButton(
                                onPressed: () {
                                  ref
                                      .watch(productListControllerProvider
                                      .notifier)
                                      .deleteProduct(
                                      productId: product.id!);
                                },
                                child: Text("Delete")),
                            ElevatedButton(
                                onPressed: () {
                                  ref
                                      .watch(productListControllerProvider
                                      .notifier)
                                      .updateProduct(
                                      updateProduct: product.copyWith(
                                          name: "手作り弁当",
                                          productDetail: "Hi"));
                                },
                                child: Text("Edit"))
                          ],
                        ),
                      );
                    },
                  ),
                  error: (error, _) => Text("エラー"),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
