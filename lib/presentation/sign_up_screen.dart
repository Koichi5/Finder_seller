import 'package:finder_seller/domain/repository/auth_repository.dart';
import 'package:finder_seller/presentation/controller/auth_controller.dart';
import 'package:finder_seller/presentation/controller/product_list_controller.dart';
import 'package:finder_seller/presentation/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerProviderNotifier =
        ref.watch(authControllerProvider.notifier);
    final authRepositoryProviderNotifier = ref.watch(authRepositoryProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("sign up"),
      ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
                  // Sign in with Google and navigate to home page
                  ElevatedButton(
                      onPressed: () async {
                        await authControllerProviderNotifier.signInWithGoogle();
                        User? user = authRepositoryProviderNotifier.getCurrentUser();
                        if(user != null) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
                        }
                      },
                      child: Text("Google")),
                  // Sign in with email and password and navigate to home page
                  ElevatedButton(
                      onPressed: () async {
                        await authControllerProviderNotifier.signInWithEmailAndPassword(
                            "koichi0806@gmail.com", "password");
                        User? user = authRepositoryProviderNotifier.getCurrentUser();
                        if(user != null) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text("Email & Password")),
                        ]
                )
            )
        )
    );
  }
}
