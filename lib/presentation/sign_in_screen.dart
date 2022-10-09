import 'package:finder_seller/domain/repository/auth_repository.dart';
import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:finder_seller/presentation/store_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inputUserEmailProvider = StateProvider<String>((ref) => "");
final inputUserPasswordProvider = StateProvider<String>((ref) => "");
final passwordObscureTextProvider = StateProvider<bool>((ref) => true);

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputUserEmail = ref.watch(inputUserEmailProvider);
    final inputUserEmailProviderNotifier =
        ref.watch(inputUserEmailProvider.notifier);
    final inputUserPassword = ref.watch(inputUserPasswordProvider);
    final inputUserPasswordProviderNotifier =
        ref.watch(inputUserPasswordProvider.notifier);
    final passwordObscureText = ref.watch(passwordObscureTextProvider);
    final passwordObscureTextNotifier =
        ref.watch(passwordObscureTextProvider.notifier);
    final authControllerProviderNotifier =
        ref.watch(authControllerProvider.notifier);
    final authRepositoryProviderNotifier = ref.watch(authRepositoryProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("新規登録"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  hintText: "メールアドレス",
                  helperText: "メールアドレスを入力してください",
                ),
                onChanged: (String text) {
                  inputUserEmailProviderNotifier.state = text;
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                obscureText: passwordObscureText ? true : false,
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "パスワード",
                    helperText: "パスワードを入力してください",
                    suffixIcon: passwordObscureText
                        ? IconButton(
                            onPressed: () {
                              passwordObscureTextNotifier.state = false;
                            },
                            icon: const Icon(Icons.visibility_off))
                        : IconButton(
                            onPressed: () {
                              passwordObscureTextNotifier.state = true;
                            },
                            icon: const Icon(Icons.visibility))),
                onChanged: (String text) {
                  inputUserPasswordProviderNotifier.state = text;
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            // Sign in with email and password and navigate to home page
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (inputUserEmailProviderNotifier.state.isEmpty ||
                                inputUserPasswordProviderNotifier.state.isEmpty)
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary),
                onPressed: () async {
                  await authControllerProviderNotifier
                      .signInWithEmailAndPassword(
                          inputUserEmail, inputUserPassword);
                  User? user = authRepositoryProviderNotifier.getCurrentUser();
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => StoreRegisterScreen()));
                  }
                },
                child: Text(
                  "登   録",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            // Sign in with Google and navigate to home page
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: OutlinedButton(
                    onPressed: () async {
                      await authControllerProviderNotifier.signInWithGoogle();
                      User? user =
                          authRepositoryProviderNotifier.getCurrentUser();
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => StoreRegisterScreen()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google_logo.png",
                          width: 20,
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Googleで登録"),
                        ),
                      ],
                    )),
              ),
            ),
          ]),
        ));
  }
}
