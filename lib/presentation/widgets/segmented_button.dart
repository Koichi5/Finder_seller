import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

final currentSelectedIndexProvider = StateProvider((ref) => 0);

Widget CustomMaterialSegmentedControl(BuildContext context, WidgetRef ref) {
  final StateController<int?> currentSelectedIndexNotifier = ref.watch(currentSelectedIndexProvider.notifier);
  final int? currentSelectedIndex = ref.watch(currentSelectedIndexProvider);
  return MaterialSegmentedControl(
    children: _children,
    selectionIndex: currentSelectedIndex,
    selectedColor: Colors.red,
    unselectedColor: Colors.white,
    borderRadius: 50,
    verticalOffset: 8.0,
    onSegmentChosen: (int index) {
      currentSelectedIndexNotifier.state = index;
    },
  );
}

final Map<int, Widget> _children = {
  0 : const Text("テンプレート"),
  1 : const Text("取り下げ"),
  2 : const Text("作成")
};
