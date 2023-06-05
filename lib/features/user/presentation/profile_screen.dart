import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_up_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/application/user_application.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routeName = 'Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCommand = ref.read(userApplicationProvider);
    final currentUser = ref.watch(userQueryProvider);
    final nameController = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: currentUser.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error $err'),
            data: (user) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'User Name:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'User ID:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user.userId,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    TextFormField(
                      controller: nameController,
                    ),
                    ElevatedButton(
                      child: const Text('Update'),
                      onPressed: () async {
                        await userCommand.updateUser(name: nameController.text);
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Delete'),
                      onPressed: () async {
                        context.goNamed(SignUpScreen.routeName);
                        await userCommand.deleteUser();
                      },
                    ),
                  ],
                ),
              );
            }));
  }
}
