import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final convexBottomBarSampleIndexProvider = StateProvider((ref) => 0);

class ConvexBottomBarSample extends HookConsumerWidget {
  ConvexBottomBarSample({Key? key}) : super(key: key);

  Map<String, Icon> contentList = {
    "Home": const Icon(Icons.home),
    "商品管理": const Icon(Icons.list_alt),
    "詳細": const Icon(Icons.settings),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convexBottomBarSampleSelectedIndex = ref.watch(convexBottomBarSampleIndexProvider);
    final convexBottomBarSampleSelectedIndexNotifier = ref.watch(convexBottomBarSampleIndexProvider.notifier);
    return ConvexAppBar(
      items: [
        for(int i = 0; i < contentList.length; i++)...{
          TabItem(title: contentList.keys.toList()[i], icon: contentList.values.toList()[i])
        }
      ],
      initialActiveIndex: 0,
      onTap: (index) {
        convexBottomBarSampleSelectedIndexNotifier.state = index;
      },
    );
  }
}
