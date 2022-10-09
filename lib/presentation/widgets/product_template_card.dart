// this file is for product template card that has "Edit", "Delete" buttons
import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:finder_seller/presentation/widgets/product_delete_icon_button.dart';
import 'package:finder_seller/presentation/widgets/product_edit_button.dart';
import 'package:finder_seller/presentation/widgets/product_edit_modal.dart';
import 'package:finder_seller/presentation/widgets/product_post_button.dart';
import 'package:finder_seller/presentation/widgets/product_register_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductTemplateCard extends HookConsumerWidget {
  const ProductTemplateCard(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discountedPrice =
        (product.regularPrice! * (1 - product.discountRate!.toInt() * 0.01))
            .round();
    return Card(
      key: ValueKey(product.id),
      color: Theme.of(context).colorScheme.background,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: product.imagePath.toString(),
                        fit: BoxFit.fill,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProductDeleteIconButton(product)
                          )
                      )]))),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.name,
                      style: const TextStyle(fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "${product.regularPrice.toString()}円",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "→",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(
                    "${discountedPrice.toString()}円",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(product.productDetail.toString(), maxLines: 3, overflow: TextOverflow.ellipsis,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("残り${product.remainCount.toString()}個", style: const TextStyle(fontSize: 20),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductEditButton(product)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductPostButton(product),
                  // child: ElevatedButton.icon(
                  //   style: ElevatedButton.styleFrom(
                  //     // Foreground color
                  //     foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  //     // Background color
                  //     backgroundColor: Theme.of(context).colorScheme.primary,
                  //   ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (_) {
                  //         return AlertDialog(
                  //             title: const Text("本当に削除しますか？"),
                  //             actions: <Widget>[
                  //               // ボタン領域
                  //               ElevatedButton(
                  //                 child: const Text("キャンセル"),
                  //                 onPressed: () => Navigator.pop(context),
                  //               ),
                  //               ElevatedButton(
                  //                   child: Text("削除"),
                  //                   onPressed: () {
                  //                     ref
                  //                         .watch(productListControllerProvider
                  //                             .notifier)
                  //                         .deleteProduct(
                  //                             productId: product.id!);
                  //                     Navigator.pop(context);
                  //                   }),
                  //             ]);
                  //       },
                  //     );
                  //   },
                  //   icon: const Icon(Icons.delete),
                  //   label: const Text('削除'),
                  // ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
