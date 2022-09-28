import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final curvedNavigationBarSelectedIndexProvider = StateProvider((ref) => 0);

class CurvedNavigationBarSample extends HookConsumerWidget {
  CurvedNavigationBarSample({Key? key}) : super(key: key);

  Map<String, Icon> contentList = {
    "Home": const Icon(Icons.home, color: Colors.white,),
    "商品管理": const Icon(Icons.list_alt, color: Colors.white,),
    "詳細": const Icon(Icons.settings, color: Colors.white,),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curvedNavigationBarSelectedIndex = ref.watch(curvedNavigationBarSelectedIndexProvider);
    final curvedNavigationBarSelectedIndexNotifier = ref.watch(curvedNavigationBarSelectedIndexProvider.notifier);
    return CurvedNavigationBar(
      items: [
        for(int i = 0; i < contentList.length; i++)...{
          contentList.values.toList()[i],
        }
      ],
      onTap: (index) {
        curvedNavigationBarSelectedIndexNotifier.state = index;
      },
      animationDuration: Duration(milliseconds: 100),
      index: curvedNavigationBarSelectedIndex,
      backgroundColor: Colors.white,
      color: Colors.red,
    );
  }
}
