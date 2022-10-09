import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final validErrorProvider = StateProvider((ref) => false);

Widget customTextField({
  required BuildContext context,
  required bool autofocus,
  required String hintText,
  required String helperText,
  required notifierState,
  // required Reader reader,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.9,
    child: TextField(
      autofocus: autofocus,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        helperText: helperText,
      ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: ,
      onChanged: (text) {
        notifierState = text;
        print("input text : $text");
        print("notifier state : $notifierState");
        // text == null || text == ""
        //     ? reader(validErrorProvider.notifier).state = true
        //     : reader(validErrorProvider.notifier).state = false;
      },
    ),
  );
}
