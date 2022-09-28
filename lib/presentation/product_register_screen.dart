import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/product_list_controller.dart';

class ProductRegisterScreen extends HookConsumerWidget {
  const ProductRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product register screen"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.watch(productListControllerProvider.notifier).addProduct(
                    name: "唐揚げ弁当",
                    imagePath: "",
                    regularPrice: 300,
                    discountRate: 30,
                    productDetail: "美味しいお弁当です。",
                  );
                },
                child: Text("Add product")),
          ],
        ),
      ),
    );
  }
}
