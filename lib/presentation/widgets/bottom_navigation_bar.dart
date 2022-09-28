import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class NormalBottomNavigationBar extends HookConsumerWidget {
  NormalBottomNavigationBar({Key? key}) : super(key: key);

  Map<String, Icon> contentList = {
    "Home": const Icon(Icons.home),
    "商品管理": const Icon(Icons.list_alt),
    "詳細": const Icon(Icons.settings),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final selectedIndexNotifier = ref.watch(selectedIndexProvider.notifier);
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        for(int i = 0; i < contentList.length; i++)...{
          BottomNavigationBarItem(
            label: contentList.keys.toList()[i],
            icon: contentList.values.toList()[i],
          ),
        }
      ],
      currentIndex: selectedIndex,
      // selectedItemColor: ,
      onTap: (index) {
        selectedIndexNotifier.state = index;
      },
    );
  }
}
