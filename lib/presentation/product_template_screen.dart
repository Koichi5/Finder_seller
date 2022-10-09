import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:finder_seller/presentation/widgets/product_edit_modal.dart';
import 'package:finder_seller/presentation/widgets/product_register_form.dart';
import 'package:finder_seller/presentation/widgets/product_template_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductTemplateScreen extends HookConsumerWidget {
  const ProductTemplateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    final productNameNotifier = ref.watch(productNameProvider.notifier);
    final productRegularNotifier = ref.watch(productRegularPriceProvider.notifier);
    final productDiscountRateNotifier = ref.watch(productDiscountRateProvider.notifier);
    final productDetailNotifier = ref.watch(productDetailProvider.notifier);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          productListState.when(
            data: (products) => products.isEmpty
                ? const Center(
                    child: Text("テンプレートはありません"),
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
                            ProductTemplateCard(product)
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
    );
  }
}
