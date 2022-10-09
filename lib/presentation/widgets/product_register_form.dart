import 'package:finder_seller/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//考えるべき点
// customTextField を使ってテキストフィールドとロジックを分離していて、正常作動していたが、
// RemainCount を追加した時点で突然動かなくなり、分離をやめた

final StateProvider<String?> productImageURLProvider =
    StateProvider((ref) => "");
final StateProvider<String> productNameProvider = StateProvider((ref) => "");
final StateProvider<int> productRegularPriceProvider =
    StateProvider((ref) => 0);
final StateProvider<int?> productDiscountRateProvider =
    StateProvider((ref) => 0);
final StateProvider<String?> productDetailProvider = StateProvider((ref) => "");
final StateProvider<int> productRemainCountProvider = StateProvider((ref) => 1);

class ProductRegisterForm extends HookConsumerWidget {
  const ProductRegisterForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNameNotifier = ref.watch(productNameProvider.notifier);
    final productRegularPriceNotifier =
        ref.watch(productRegularPriceProvider.notifier);
    final productDiscountRateNotifier =
        ref.watch(productDiscountRateProvider.notifier);
    final productDetailNotifier = ref.watch(productDetailProvider.notifier);
    final productRemainCountNotifier = ref.watch(productRemainCountProvider.notifier);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                hintText: "商品名",
                helperText: "商品名を入力してください",
              ),
              onChanged: (text) {
                productNameNotifier.state = text;
                print("input text : $text");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                hintText: "定価",
                helperText: "定価を入力してください",
              ),
              onChanged: (text) {
                productRegularPriceNotifier.state = int.parse(text);
                print("input text : $text");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                hintText: "割引率",
                helperText: "割引率を入力してください",
              ),
              onChanged: (text) {
                productDiscountRateNotifier.state = int.parse(text);
                print("input text : $text");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                hintText: "詳細情報",
                helperText: "詳細情報を入力してください",
              ),
              onChanged: (text) {
                productDetailNotifier.state = text;
                print("input text : $text");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                hintText: "残り個数",
                helperText: "残り個数を入力してください",
              ),
              onChanged: (text) {
                productRemainCountNotifier.state = int.parse(text);
                print("input text : $text");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
          // customTextField(
          //   context: context,
          //   autofocus: true,
          //   hintText: "商品名",
          //   helperText: "商品名を入力してください",
          //   notifierState: ref.watch(productNameProvider.notifier).state,
          //   // reader: ref.watch,
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),
          // customTextField(
          //   context: context,
          //   autofocus: false,
          //   hintText: "定価",
          //   helperText: "定価を入力してください",
          //   notifierState: productRegularPriceNotifier.state,
          //   // reader: ref.watch,
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),
          // customTextField(
          //   context: context,
          //   autofocus: false,
          //   hintText: "割引率",
          //   helperText: "割引率を入力してください",
          //   notifierState: productDiscountRateNotifier.state,
          //   // reader: ref.watch,
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),
          // customTextField(
          //   context: context,
          //   autofocus: false,
          //   hintText: "詳細情報",
          //   helperText: "詳細情報を入力してください",
          //   notifierState: productDetailNotifier.state,
          //   // reader: ref.watch,
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),
          // customTextField(
          //   context: context,
          //   autofocus: false,
          //   hintText: "残り個数",
          //   helperText: "残り個数を入力してください",
          //   notifierState: productRemainCountNotifier.state,
          //   // reader: ref.watch,
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: "商品名",
          //     helperText: "商品名を入力してください",
          //   ),
          //   keyboardType: TextInputType.name,
          //   maxLines: 1,
          //   onChanged: (String text) {
          //       productNameNotifier.state = text;
          //     }
          // ),
          // TextField(
          //     decoration: InputDecoration(
          //       hintText: "定価",
          //       helperText: "定価を入力してください",
          //     ),
          //     keyboardType: TextInputType.name,
          //     maxLines: 1,
          //     onChanged: (String text) {
          //       productRegularNotifier.state = int.parse(text);
          //     }
          // ),
          // TextField(
          //     decoration: InputDecoration(
          //       hintText: "割引率",
          //       helperText: "割引率を入力してください",
          //     ),
          //     keyboardType: TextInputType.name,
          //     maxLines: 1,
          //     onChanged: (String text) {
          //       productDiscountRateNotifier.state = int.parse(text);
          //     }
          // ),
          // TextField(
          //     decoration: InputDecoration(
          //       hintText: "詳細情報",
          //       helperText: "詳細情報を入力してください",
          //     ),
          //     keyboardType: TextInputType.name,
          //     maxLines: 1,
          //     onChanged: (String text) {
          //       productDetailNotifier.state = text;
          //     }
          // ),

          // for(int i = 0; i < _productHintTextHelperTextList.length; i++)...{
          //   TextField(
          //     onSubmitted: ,
          //     decoration: InputDecoration(
          //       hintText: _productHintTextHelperTextList.keys.toList()[i],
          //       helperText: _productHintTextHelperTextList.values.toList()[i],
          //     ),
          //   )
          // }
          //   _customTextField("商品名", "商品名を入力してください", TextInputType.name, 1, (){}),
          //   _customTextField("定価", "定価を入力してください", TextInputType.number, 1, (){}),
          //   _customTextField("割引率", "割引率を入力してください", TextInputType.number, 1, (){}),
          //   _customTextField("詳細情報", "詳細情報を入力してください", TextInputType.multiline, null, (){}),
        ],
      ),
    );
  }
}
//   Widget _customTextField(String hintText, String helperText, TextInputType keyboardType, int? maxLines, onSubmitted) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextField(
//           decoration: InputDecoration(
//             hintText: hintText,
//             helperText: helperText,
//           ),
//           keyboardType: keyboardType,
//           maxLines: maxLines,
//           onSubmitted: onSubmitted,
//         ),
//         const SizedBox(height: 30,),
//       ],
//     );
//   }
// }
