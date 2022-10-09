import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductPostButton extends HookConsumerWidget {
  const ProductPostButton(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        // Foreground color
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        // Background color
        backgroundColor: product.isExhibited ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () {
        product.isExhibited
            ? null
            : ref.watch(productListControllerProvider.notifier).updateProduct(
                updateProduct:
                    product.copyWith(isExhibited: !product.isExhibited));
      },
      icon: product.isExhibited ? Icon(Icons.done) : Icon(Icons.add),
      label: product.isExhibited ? Text("投稿中") : Text("投稿"),
    );
  }
}
