import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDeleteIconButton extends HookConsumerWidget {
  const ProductDeleteIconButton(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
                alignment: Alignment.center,
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                icon: const Icon(Icons.delete),
                title: const Text("本当に削除しますか？"),
                actions: <Widget>[
                  Column(
                    children: [
                      const Text(
                        "一度テンプレートを削除すると\n復元することはできません",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: const Text("キャンセル"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                                child: const Text(
                                  "削除",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  ref
                                      .watch(productListControllerProvider
                                          .notifier)
                                      .deleteProduct(productId: product.id!);
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]);
          },
        );
      },
      icon: Icon(
        Icons.delete,
        color: Theme.of(context).colorScheme.primary,
        size: 30,
      ),
    );
  }
}
