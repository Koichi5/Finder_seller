import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavyBarSelectedIndexProvider = StateProvider((ref) => 0);

class BottomNavyBarExample extends HookConsumerWidget {
  BottomNavyBarExample({Key? key}) : super(key: key);

  Map<String, Icon> contentList = {
    "Home": const Icon(Icons.home, color: Colors.red,),
    "商品管理": const Icon(Icons.list_alt, color: Colors.red,),
    "詳細": const Icon(Icons.settings, color: Colors.red,),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavyBarSelectedIndex = ref.watch(bottomNavyBarSelectedIndexProvider);
    final bottomNavyBarSelectedIndexNotifier = ref.watch(bottomNavyBarSelectedIndexProvider.notifier);
    return BottomNavyBar(
      items: [
        for(int i = 0; i < contentList.length; i++)...{
          BottomNavyBarItem(
            title: Text(contentList.keys.toList()[i], style: TextStyle(color: Colors.red),),
            icon: contentList.values.toList()[i],
            activeColor: Colors.red
          ),
        }
      ],
        selectedIndex: bottomNavyBarSelectedIndex,
      onItemSelected: (index){
        bottomNavyBarSelectedIndexNotifier.state = index;
      }
    );
  }
}
