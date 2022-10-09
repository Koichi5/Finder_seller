import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder_seller/domain/product.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExhibitedProductCard extends HookConsumerWidget {
  const ExhibitedProductCard({required this.product, Key? key})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      key: ValueKey(product.id),
      color: Theme.of(context).colorScheme.background,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  product.imagePath == null && product.imagePath == ""
                      ? Container(
                          color: Colors.grey,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width * 0.3,
                                imageUrl: product.imagePath!,
                                fit: BoxFit.fill,
                              ))),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.name, overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    ref
                        .watch(productListControllerProvider.notifier)
                        .updateProduct(
                            updateProduct: product.copyWith(
                                isExhibited: !product.isExhibited));
                  },
                  icon: const Icon(Icons.delete)),
            ),
          ],
        ),
      ),
    );
  }
}
