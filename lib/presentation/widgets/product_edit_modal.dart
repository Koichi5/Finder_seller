import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:finder_seller/presentation/widgets/product_register_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/product.dart';

class ProductEditModal extends HookConsumerWidget {
  const ProductEditModal(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNameNotifier = ref.watch(productNameProvider.notifier);
    final productRegularNotifier =
        ref.watch(productRegularPriceProvider.notifier);
    final productDiscountRateNotifier =
        ref.watch(productDiscountRateProvider.notifier);
    final productDetailNotifier = ref.watch(productDetailProvider.notifier);
    final productRemainCountNotifier =
        ref.watch(productRemainCountProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("テンプレート変更"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                    autofocus: true,
                    controller: TextEditingController(text: product.name),
                    decoration: const InputDecoration(
                      filled: true,
                      helperText: "商品名を入力してください",
                    ),
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    onChanged: (String text) {
                      productNameNotifier.state = text;
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                    controller: TextEditingController(
                        text: product.regularPrice.toString()),
                    decoration: const InputDecoration(
                      filled: true,
                      helperText: "定価を入力してください",
                    ),
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    onChanged: (String text) {
                      productRegularNotifier.state = int.parse(text);
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                    controller: TextEditingController(
                        text: product.discountRate.toString()),
                    decoration: const InputDecoration(
                      filled: true,
                      helperText: "割引率を入力してください",
                    ),
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    onChanged: (String text) {
                      productDiscountRateNotifier.state = int.parse(text);
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                    controller:
                        TextEditingController(text: product.productDetail),
                    decoration: const InputDecoration(
                      filled: true,
                      helperText: "詳細情報を入力してください",
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    onChanged: (String text) {
                      productDetailNotifier.state = text;
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                    controller: TextEditingController(
                        text: product.remainCount.toString()),
                    decoration: const InputDecoration(
                      filled: true,
                      helperText: "残り個数を入力してください",
                    ),
                    maxLines: 1,
                    onChanged: (String text) {
                      productRemainCountNotifier.state = int.parse(text);
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Foreground color
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      // Background color
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () {
                      ref
                          .watch(productListControllerProvider.notifier)
                          .updateProduct(
                              updateProduct: product.copyWith(
                            name: productNameNotifier.state,
                            regularPrice: productRegularNotifier.state,
                            discountRate: productDiscountRateNotifier.state,
                            productDetail: productDetailNotifier.state,
                            remainCount: productRemainCountNotifier.state,
                          ));
                      Navigator.pop(context);
                    },
                    child: Text("変  更", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
