import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/application/auth_application.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_in_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/application/user_application.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});
  static const routeName = 'SignUp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text('新規登録')),
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
                controller: usernameController,
                autofocus: false,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: '名前',
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
                child: const Text('SignUp'),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await ref.read(authApplicationProvider).signUP(
                            email: emailController.text,
                            password: passwordController.text,
                            name: usernameController.text,
                          );

                      await ref
                          .read(userApplicationProvider)
                          .createUser(name: usernameController.text);

                      context.goNamed(ProfileScreen.routeName);
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ),
              ElevatedButton(
                child: const Text('go to SignIn'),
                onPressed: () {
                  context.goNamed(SignInScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
