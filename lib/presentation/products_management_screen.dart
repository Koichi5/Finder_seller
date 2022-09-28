import 'package:finder_seller/presentation/widgets/segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsManagementScreen extends HookConsumerWidget {
  const ProductsManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Segmented button on App bar.
          CustomMaterialSegmentedControl(context, ref),
        ],
      ),
      // body would be a page view that control three pages
      // three pages could be [ product delete, product register, product template ]
      // body: ,
    );
  }
}
