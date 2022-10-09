import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/presentation/widgets/product_edit_modal.dart';
import 'package:finder_seller/presentation/widgets/product_register_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductEditButton extends HookConsumerWidget {
  const ProductEditButton(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNameNotifier = ref.watch(productNameProvider.notifier);
    final productRegularNotifier =
        ref.watch(productRegularPriceProvider.notifier);
    final productDiscountRateNotifier =
        ref.watch(productDiscountRateProvider.notifier);
    final productDetailNotifier = ref.watch(productDetailProvider.notifier);
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
          // Foreground color
          // foregroundColor:
          //     Theme.of(context).colorScheme.onSecondaryContainer,
          // Background color
          // backgroundColor:
          //     Theme.of(context).colorScheme.secondaryContainer,
          side: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      )).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      onPressed: () {
        productNameNotifier.state = product.name;
        productRegularNotifier.state = product.regularPrice!;
        productDiscountRateNotifier.state = product.discountRate;
        productDetailNotifier.state = product.productDetail;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductEditModal(product),
                fullscreenDialog: true));
      },
      icon: Icon(
        Icons.edit,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        "編集",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
