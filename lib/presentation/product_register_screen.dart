import 'package:finder_seller/presentation/widgets/product_register_form.dart';
import 'package:finder_seller/presentation/widgets/segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/product_list_controller.dart';

final emptyImageProvider = StateProvider((ref) => "");

class ProductRegisterScreen extends HookConsumerWidget {
  const ProductRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productImageURLProviderNotifier =
        ref.watch(productImageURLProvider.notifier);
    final emptyImageProviderNotifier = ref.watch(emptyImageProvider.notifier);
    final productNameProviderNotifier = ref.watch(productNameProvider.notifier);
    final productRegularPriceProviderNotifier =
        ref.watch(productRegularPriceProvider.notifier);
    final productDiscountRateProviderNotifier =
        ref.watch(productDiscountRateProvider.notifier);
    final productDetailProviderNotifier = ref.watch(productDetailProvider.notifier);
    final productRemainCountProviderNotifier =
        ref.watch(productRemainCountProvider.notifier);
    final productListControllerProviderNotifier =
        ref.watch(productListControllerProvider.notifier);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                productImageURLProviderNotifier.state =
                    await productListControllerProviderNotifier
                        .pickProductImage();
                emptyImageProviderNotifier.state =
                    productImageURLProviderNotifier.state!;
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.28,
                color: Colors.grey,
                child: emptyImageProviderNotifier.state.isEmpty
                    ? const Text("画像を選択")
                    : Image.network(emptyImageProviderNotifier.state),
              ),
            ),
            ProductRegisterForm(),
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
                  ref.watch(productListControllerProvider.notifier).addProduct(
                        name: ref.watch(productNameProvider.notifier).state,
                        imagePath: productImageURLProviderNotifier.state,
                        regularPrice: ref.watch(productRegularPriceProvider),
                        discountRate: ref.watch(productDiscountRateProvider)!,
                        productDetail: ref.watch(productDetailProvider),
                        remainCount: ref.watch(productRemainCountProvider),
                      );
                  // ref.watch(productListControllerProvider.notifier)
                  print("${ref.watch(productNameProvider.notifier).state}");
                  print(productImageURLProviderNotifier.state);
                  print(productRegularPriceProviderNotifier.state);
                  print(productDiscountRateProviderNotifier.state!);
                  print(productDetailProviderNotifier.state);
                  print(productRemainCountProviderNotifier.state);
                  ref.watch(currentSelectedIndexProvider.notifier).state = 1;
                },
                child: Text(
                  "投稿",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
