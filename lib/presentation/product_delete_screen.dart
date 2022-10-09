import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:finder_seller/presentation/widgets/exhibited_product_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDeleteScreen extends HookConsumerWidget {
  const ProductDeleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    // final authControllerProviderNotifier = ref.watch(authControllerProvider.notifier);
    return const ExhibitedProductList();
  }
}
