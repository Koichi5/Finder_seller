import 'package:finder_seller/domain/repository/store_repository.dart';
import 'package:finder_seller/domain/store.dart';
import 'package:finder_seller/presentation/controller/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreEditScreen extends HookConsumerWidget {
  const StoreEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeListControllerProvider.notifier).retrieveStores();
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール変更"),
      ),

    );
  }
}
