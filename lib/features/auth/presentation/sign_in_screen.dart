import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/application/auth_application.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_up_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});
  static const routeName = 'SignIn';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: emailController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'メールアドレス',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
              ),
              const Spacer(),
              TextFormField(
                controller: passwordController,
                autofocus: false,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
              ),
              const Spacer(),
              Expanded(
                child: Container(),
              ),
              ElevatedButton(
                child: const Text('SignIn'),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await ref.read(authApplicationProvider).signIN(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                      context.goNamed(ProfileScreen.routeName);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ),
              ElevatedButton(
                child: const Text('go to SingUp'),
                onPressed: () {
                  context.goNamed(SignUpScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
