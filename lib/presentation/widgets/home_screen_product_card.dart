// this file ids for product template card that has "Edit", "Delete" buttons
import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder_seller/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreenProductCard extends HookConsumerWidget {
  const HomeScreenProductCard(this.product, {Key? key}) : super(key: key);

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
                    child: CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: product.imagePath.toString(),
                      fit: BoxFit.fill,
                    ))),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.name,
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                    "$discountedPrice円",
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.productDetail.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                bottom: 20,
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "残り${product.remainCount}個",
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
