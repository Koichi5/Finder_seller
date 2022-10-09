import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/store_controller.dart';

class SellerSignUpScreen extends HookConsumerWidget {
  const SellerSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("seller sign up"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.watch(storeListControllerProvider.notifier).addStore(
                    name: "Store",
                    isSuperMarket: false,
                    postCode: 5330032,
                    address: "大阪府大阪市東淀川区淡路4-6-49",
                    phoneNumber: "080-45589517",
                    genre: "ラーメン屋",
                  );
                },
                child: Text("Add store")),
          ],
        ),
      ),
    );
  }
}
