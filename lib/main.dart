import 'package:finder_seller/color_schemes.g.dart';
import 'package:finder_seller/domain/repository/general_providers.dart';
import 'package:finder_seller/presentation/home_screen.dart';
import 'package:finder_seller/presentation/intro_slider_screen.dart';
import 'package:finder_seller/presentation/product_register_screen.dart';
import 'package:finder_seller/presentation/product_template_screen.dart';
import 'package:finder_seller/presentation/seller_sign_up_screen.dart';
import 'package:finder_seller/presentation/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Finder Seller',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/intro_slider': (BuildContext context) => IntroSliderScreen(),
          '/home': (BuildContext context) => HomeScreen(),
          '/sign_up': (BuildContext context) => SignUpScreen(),
          '/seller_sign_up': (BuildContext context) => SellerSignUpScreen(),
          '/product_register': (BuildContext context) =>
              ProductRegisterScreen(),
          '/product_template': (BuildContext context) =>
              ProductTemplateScreen(),
        },
    home: IntroSliderScreen());
        // initialRoute: '/home',
        // home: StreamBuilder<User?>(
        //     stream: ref.watch(firebaseAuthProvider).authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: CircularProgressIndicator(),);
        //       }
        //       if (snapshot.hasData) {
        //         return HomeScreen();
        //       }
        //       return IntroSliderScreen();
        //     }));
  }
}

// class MyHomePage extends HookConsumerWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Product product;
//     final productListState = ref.watch(productListControllerProvider);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("app"),
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//               child: Column(children: [
//             // ElevatedButton(
//             //     onPressed: () {
//             //       ref.watch(authControllerProvider.notifier).signInWithGoogle();
//             //     },
//             //     child: Text("Google")),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       ref
//             //           .watch(authControllerProvider.notifier)
//             //           .signInWithEmailAndPassword(
//             //               "koichi0801@gmail.com", "password");
//             //     },
//             //     child: Text("Email & Password")),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       ref.watch(authControllerProvider.notifier).signOut();
//             //     },
//             //     child: Text("SignOut")),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       ref.watch(productListControllerProvider.notifier).addProduct(
//             //             name: "唐揚げ弁当",
//             //             imagePath: "",
//             //             regularPrice: 300,
//             //             discountRate: 30,
//             //             productDetail: "美味しいお弁当です。",
//             //           );
//             //     },
//             //     child: Text("Add product")),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       ref.watch(storeListControllerProvider.notifier).addStore(
//             //             name: "Store",
//             //             isSuperMarket: false,
//             //             postCode: "533-0032",
//             //             address: "大阪府大阪市東淀川区淡路4-6-49",
//             //             phoneNumber: "080-45589517",
//             //             genre: "ラーメン屋",
//             //           );
//             //     },
//             //     child: Text("Add store")),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 productListState.when(
//                   data: (products) => products.isEmpty
//                       ? const Center(
//                           child: Text("Products is empty"),
//                         )
//                       : ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: products.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final product = products[index];
//                             return Container(
//                               key: ValueKey(product.id),
//                               child: Column(
//                                 children: [
//                                   Text(product.name),
//                                   Image.network(product.imagePath.toString()),
//                                   Text(product.productDetail.toString()),
//                                   Text("${product.regularPrice}円"),
//                                   Text("${product.discountRate}"),
//                                   ElevatedButton(
//                                       onPressed: () {
//                                         ref
//                                             .watch(productListControllerProvider
//                                                 .notifier)
//                                             .deleteProduct(
//                                                 productId: product.id!);
//                                       },
//                                       child: Text("Delete")),
//                                   ElevatedButton(
//                                       onPressed: () {
//                                         ref
//                                             .watch(productListControllerProvider
//                                                 .notifier)
//                                             .updateProduct(
//                                                 updateProduct: product.copyWith(
//                                                     name: "手作り弁当",
//                                                     productDetail: "Hi"));
//                                       },
//                                       child: Text("Edit"))
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                   error: (error, _) => Text("エラー"),
//                   loading: () => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 productListState.when(
//                   data: (products) => products.isEmpty
//                       ? const Center(
//                           child: Text("Products is empty"),
//                         )
//                       : ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: products.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final product = products[index];
//                             return product.isExhibited
//                                 ? Container(
//                                     key: ValueKey(product.id),
//                                     child: Column(
//                                       children: [
//                                         Text(product.name),
//                                         Image.network(
//                                             product.imagePath.toString()),
//                                         Text(product.productDetail.toString()),
//                                         Text("${product.regularPrice}円"),
//                                         Text("${product.discountRate}"),
//                                         // ElevatedButton(
//                                         //     onPressed: () {
//                                         //       ref
//                                         //           .watch(productListControllerProvider
//                                         //           .notifier)
//                                         //           .deleteProduct(
//                                         //           productId: product.id!);
//                                         //     },
//                                         //     child: Text("Delete")),
//                                         // ElevatedButton(
//                                         //     onPressed: () {
//                                         //       ref
//                                         //           .watch(productListControllerProvider
//                                         //           .notifier)
//                                         //           .updateProduct(
//                                         //           updateProduct: product.copyWith(
//                                         //               name: "手作り弁当",
//                                         //               productDetail: "Hi"));
//                                         //     },
//                                         //     child: Text("Edit"))
//                                         ElevatedButton(
//                                             onPressed: () {
//                                               ref
//                                                   .watch(
//                                                       productListControllerProvider
//                                                           .notifier)
//                                                   .updateProduct(
//                                                       updateProduct:
//                                                           product.copyWith(
//                                                               isExhibited: !product
//                                                                   .isExhibited));
//                                             },
//                                             child: Text("投稿中止"))
//                                       ],
//                                     ),
//                                   )
//                                 : Text("表示中の商品はありません");
//                           },
//                         ),
//                   error: (error, _) => Text("エラー"),
//                   loading: () => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               ],
//             )
//             // ElevatedButton(
//             //     onPressed: (){
//             //       ref.watch(productListControllerProvider.notifier).deleteProduct(productId: product.id!);
//             //     },
//             //     child: Text("Delete product"))
//             //     productListState.when(
//             //     data: (products) => products.isEmpty
//             //     ? const Center(
//             //   child: Text(
//             //     "Tap + to add an item",
//             //     style: TextStyle(fontSize: 20),
//             //   ),
//             // )
//             //     : ListView.builder(
//             //   itemCount: products.length,
//             //   itemBuilder: (BuildContext context, int index) {
//             //     final product = products[index];
//             //     return ListTile(
//             //       key: ValueKey(product.id),
//             //       title: Text(product.name),
//             //       trailing: Checkbox(
//             //         value: false,
//             //         onChanged: (val) {
//             //           ref
//             //               .read(productListControllerProvider.notifier)
//             //               .updateProduct(
//             //               updateProduct:
//             //               product.copyWith(name: "changed"));
//             //         },
//             //       ),
//             //       // onTap: () => AddItemDialog.show(context, item),
//             //       onLongPress: () {
//             //         ref
//             //             .read(productListControllerProvider.notifier)
//             //             .deleteProduct(productId: product.id!);
//             //       },
//             //     );
//             //   },
//             // ),
//             // loading: () => const Center(
//             // child: CircularProgressIndicator(),
//             // ),
//             // error: (error, et) => Text("$error")
//             // // ProductListError(
//             // // message: error is CustomException
//             // // ? error.message!
//             // //     : "Something went wrong",
//             // // ),
//             //     )])),
//           ])),
//         ));
//   }
// }
