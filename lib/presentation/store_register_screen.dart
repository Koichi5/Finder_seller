import 'package:finder_seller/presentation/controller/store_controller.dart';
import 'package:finder_seller/presentation/home_screen.dart';
import 'package:finder_seller/presentation/widgets/store_register_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreRegisterScreen extends HookConsumerWidget {
  const StoreRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("店舗登録"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StoreRegisterForm(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Foreground color
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    // Background color
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: (){
                  ref.watch(storeListControllerProvider.notifier).addStore(
                      name: ref.watch(storeNameProvider),
                      isSuperMarket: false,
                      postCode: ref.watch(storePostCodeProvider),
                      address: ref.watch(storeAddressProvider),
                      phoneNumber: ref.watch(storePhoneNumberProvider),
                      genre: 'a');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text("登録", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,)
          ],
        ),
      ),
    );
  }
}
