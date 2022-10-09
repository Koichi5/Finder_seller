import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:finder_seller/presentation/products_management_screen.dart';
import 'package:finder_seller/presentation/setting_screen.dart';
import 'package:finder_seller/presentation/widgets/bottom_navigation_bar.dart';
import 'package:finder_seller/presentation/widgets/bottom_navy_bar.dart';
import 'package:finder_seller/presentation/widgets/convex_bottom_bar.dart';
import 'package:finder_seller/presentation/widgets/curved_navigation_bar.dart';
import 'package:finder_seller/presentation/widgets/home_screen_product_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<Widget> homePageList = [
  HomeScreenProductList(),
  ProductsManagementScreen(),
  SettingScreen(),
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    final productListControllerProviderNotifier =
        ref.watch(productListControllerProvider.notifier);
    final authControllerProviderNotifier =
        ref.watch(authControllerProvider.notifier);
    final bottomNavyBarSelectedIndex =
        ref.watch(bottomNavyBarSelectedIndexProvider);
    return Scaffold(
      appBar: bottomNavyBarSelectedIndex == 1
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              title: bottomNavyBarSelectedIndex == 0
                  ? const Text("投稿中商品")
                  : bottomNavyBarSelectedIndex == 1
                      ? null
                      : const Text("詳細設定")),
      // If you implement [bottom navigation bar], tab could be 2 ~ 5
      // home, product management, setting

      // bottomNavigationBar: NormalBottomNavigationBar(),
      // bottomNavigationBar: ConvexBottomBarSample(),
      // bottomNavigationBar: CurvedNavigationBarSample(),
      bottomNavigationBar: BottomNavyBarExample(),
      body: pageController(bottomNavyBarSelectedIndex),

      // body: Center(
      //   child: Column(
      //     children: [
      //       Text("List of Products whose propathi 'isExhibited' is true"),
      //       ElevatedButton(
      //           onPressed: () async {
      //             await authControllerProviderNotifier.signOut();
      //           },
      //           child: Text("SignOut")),
      //       Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           productListState.when(
      //             data: (products) => products.isEmpty
      //                 ? const Center(
      //                     child: Text("Products is empty"),
      //                   )
      //                 : ListView.builder(
      //                     shrinkWrap: true,
      //                     physics: NeverScrollableScrollPhysics(),
      //                     itemCount: products.length,
      //                     itemBuilder: (BuildContext context, int index) {
      //                       final product = products[index];
      //                       return product.isExhibited
      //                           ? Container(
      //                               key: ValueKey(product.id),
      //                               child: Column(
      //                                 children: [
      //                                   Text(product.name),
      //                                   Image.network(
      //                                       product.imagePath.toString()),
      //                                   Text(product.productDetail.toString()),
      //                                   Text("${product.regularPrice}円"),
      //                                   Text("${product.discountRate}"),
      //                                   // ElevatedButton(
      //                                   //     onPressed: () {
      //                                   //       ref
      //                                   //           .watch(productListControllerProvider
      //                                   //           .notifier)
      //                                   //           .deleteProduct(
      //                                   //           productId: product.id!);
      //                                   //     },
      //                                   //     child: Text("Delete")),
      //                                   // ElevatedButton(
      //                                   //     onPressed: () {
      //                                   //       ref
      //                                   //           .watch(productListControllerProvider
      //                                   //           .notifier)
      //                                   //           .updateProduct(
      //                                   //           updateProduct: product.copyWith(
      //                                   //               name: "手作り弁当",
      //                                   //               productDetail: "Hi"));
      //                                   //     },
      //                                   //     child: Text("Edit"))
      //                                   ElevatedButton(
      //                                       onPressed: () {
      //                                         ref
      //                                             .watch(
      //                                                 productListControllerProvider
      //                                                     .notifier)
      //                                             .updateProduct(
      //                                                 updateProduct:
      //                                                     product.copyWith(
      //                                                         isExhibited: !product
      //                                                             .isExhibited));
      //                                       },
      //                                       child: Text("投稿中止"))
      //                                 ],
      //                               ),
      //                             )
      //                           : Text("表示中の商品はありません");
      //                     },
      //                   ),
      //             error: (error, _) => Text("エラー"),
      //             loading: () => const Center(
      //               child: CircularProgressIndicator(),
      //             ),
      //           ),
      //           ElevatedButton(
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/setting');
      //               },
      //               child: Text("Setting")),
      //           GestureDetector(
      //             onTap: () async {
      //               // await productListControllerProviderNotifier.pickProductImage();
      //             },
      //             child: SizedBox(
      //               width: 200,
      //               height: 200,
      //               child: productListControllerProviderNotifier.imageFile != null
      //                   ? Image.file(
      //                       productListControllerProviderNotifier.imageFile!)
      //                   : Container(
      //                       color: Colors.red,
      //                     ),
      //             ),
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  pageController(i) {
    return homePageList[i];
  }
}
