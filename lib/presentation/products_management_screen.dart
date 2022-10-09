import 'package:finder_seller/presentation/product_delete_screen.dart';
import 'package:finder_seller/presentation/product_register_screen.dart';
import 'package:finder_seller/presentation/product_template_screen.dart';
import 'package:finder_seller/presentation/widgets/segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<Widget> productManagementScreenList = [
  Expanded(flex: 1, child: ProductTemplateScreen()),
  Expanded(flex: 1, child: ProductDeleteScreen()),
  Expanded(flex: 1, child: ProductRegisterScreen()),
];


class ProductsManagementScreen extends HookConsumerWidget {
  const ProductsManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelectedIndex = ref.watch(currentSelectedIndexProvider);
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomMaterialSegmentedControl(context, ref),
            ),
            productsManagementPageController(currentSelectedIndex)
          ],
        ),
      ),
    );
  }
  productsManagementPageController(i) {
    return productManagementScreenList[i];
  }
}
