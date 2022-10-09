import 'package:finder_seller/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<String?> storeImageURLProvider = StateProvider((ref) => "");
final StateProvider<String> storeNameProvider = StateProvider((ref) => "");
final StateProvider<int> storePostCodeProvider = StateProvider((ref) => 0);
final StateProvider<String> storeAddressProvider = StateProvider((ref) => "");
final StateProvider<String> storePhoneNumberProvider =
    StateProvider((ref) => "");
final StateProvider<int> storeSeatsProvider = StateProvider((ref) => 0);
final StateProvider<int> storeParkingProvider = StateProvider((ref) => 0);
final StateProvider<String> storeHomePageURLProvider =
    StateProvider((ref) => "");
final StateProvider<String> storeTwitterURLProvider =
    StateProvider((ref) => "");
final StateProvider<String> storeInstagramURLProvider =
    StateProvider((ref) => "");
final StateProvider<String> storeFaceBookURLProvider =
    StateProvider((ref) => "");

class StoreRegisterForm extends HookConsumerWidget {
  const StoreRegisterForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeImageURLNotifier = ref.watch(storeImageURLProvider.notifier);
    final storeNameNotifier = ref.watch(storeNameProvider.notifier);
    final storePostCodeNotifier = ref.watch(storePostCodeProvider.notifier);
    final storeAddressNotifier = ref.watch(storeAddressProvider.notifier);
    final storePhoneNumberNotifier =
        ref.watch(storePhoneNumberProvider.notifier);
    final storeSeatsNotifier = ref.watch(storeSeatsProvider.notifier);
    final storeParkingNotifier = ref.watch(storeParkingProvider.notifier);
    final storeHomePageURLNotifier =
        ref.watch(storeHomePageURLProvider.notifier);
    final storeTwitterURLNotifier = ref.watch(storeTwitterURLProvider.notifier);
    final storeInstagramURLNotifier =
        ref.watch(storeInstagramURLProvider.notifier);
    final storeFaceBookURLNotifier =
        ref.watch(storeFaceBookURLProvider.notifier);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                filled: true,
                hintText: "店舗名",
                helperText: "店舗名を入力してください",
              ),
            onChanged: (text) {
              storeNameNotifier.state = text;
              print("input text : $text");
              print("store state : ${storeNameNotifier.state}");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "郵便番号",
                helperText: "郵便番号を入力してください",
              ),
              onChanged: (text) {
                storePostCodeNotifier.state = int.parse(text);
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "住所",
                helperText: "住所を入力してください",
              ),
              onChanged: (text) {
                storeAddressNotifier.state = text;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "電話番号",
                helperText: "電話番号を入力してください",
              ),
              onChanged: (text) {
                storePhoneNumberNotifier.state = text;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "席数",
                helperText: "席数を入力してください",
              ),
              onChanged: (text) {
                storeSeatsNotifier.state = int.parse(text);
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "駐車可能台数",
                helperText: "駐車可能台数を入力してください",
              ),
              onChanged: (text) {
                storeParkingNotifier.state = int.parse(text);
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "ホームページURL",
                helperText: "ホームページのURLを入力してください",
              ),
              onChanged: (text) {
                storeHomePageURLNotifier.state = text;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Twitter URL",
                helperText: "TwitterのURLを入力してください",
              ),
              onChanged: (text) {
                storeTwitterURLNotifier.state = text;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Instagram URL",
                helperText: "InstagramのURLを入力してください",
              ),
              onChanged: (text) {
                storeInstagramURLNotifier.state = text;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: false,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Facebook URL",
                helperText: "FacebookのURLを入力してください",
              ),
              onChanged: (text) {
                storeFaceBookURLNotifier.state = text;
              },
            ),
          ),
          // customTextField(
          //   context: context,
          //   autofocus: true,
          //   hintText: "店舗名",
          //   helperText: "店舗名を入力してください",
          //   notifierState: storeNameNotifier.state,
          //   // reader: ref.watch,
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
