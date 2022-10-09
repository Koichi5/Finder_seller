import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavyBarSelectedIndexProvider = StateProvider((ref) => 0);

class BottomNavyBarExample extends HookConsumerWidget {
  BottomNavyBarExample({Key? key}) : super(key: key);

  Map<String, IconData> contentList = {
    "Home": Icons.home,
    "商品管理": Icons.list_alt,
    "詳細": Icons.settings,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavyBarSelectedIndex =
        ref.watch(bottomNavyBarSelectedIndexProvider);
    final bottomNavyBarSelectedIndexNotifier =
        ref.watch(bottomNavyBarSelectedIndexProvider.notifier);
    return BottomNavyBar(
        items: [
          for (int i = 0; i < contentList.length; i++) ...{
            BottomNavyBarItem(
                title: Text(
                  contentList.keys.toList()[i],
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                icon: Icon(contentList.values.toList()[i],
                    color: Theme.of(context).colorScheme.primary),
                activeColor: Theme.of(context).colorScheme.primary),
          }
        ],
        selectedIndex: bottomNavyBarSelectedIndex,
        onItemSelected: (index) {
          bottomNavyBarSelectedIndexNotifier.state = index;
        });
  }
}
