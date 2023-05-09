import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/i_user.dart';

class UserCommand {
  UserCommand({
    required this.userManager,
  });

  final IUserService userManager;

  Future<void> createUser({
    required String name,
  }) async {
    print('🐯 UserCommand createUser IN !!! ');
    try {
      await userManager.createUser(name);
    } on FirebaseAuthException {
      print('🐯 createUser  失敗 !!! ');
      rethrow;
    }
  }

  Future<void> updateUser({
    required String name,
  }) async {
    print('🐯 UserCommand updateUser IN !!! ');
    try {
      await userManager.updateUser(name);
    } catch (e) {
      print('🐯 updateUser  失敗 !!! ');
      rethrow;
    }
  }

  Future<void> deleteUser() async {
    print('🐯 UserCommand deleteUser IN !!! ');
    try {
      await userManager.deleteUser();
    } catch (e) {
      print('🐯 deleteUser  失敗 !!! ');
      rethrow;
    }
  }
}
