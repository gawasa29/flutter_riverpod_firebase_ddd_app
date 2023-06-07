import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/infrastructure/refs/auth_refs.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/application/user_application.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/refs/user_refs.dart';

class UserRepository {
  UserRepository(
    this._ref,
  );

  final AutoDisposeProviderRef<UserApplicationService> _ref;

  Future<void> createUser(UserEntity user) async {
    await userDocRef(userId: user.userId).set(user);
  }

  Stream<UserEntity> readUser() {
    return userDocRef(userId: _ref.read(userIdAsyncValueProvider).value!)
        .snapshots()
        .map((snap) => snap.data()!);
  }

  Future<void> updateUser(String name) async {
    await userDocRef(userId: _ref.read(userIdAsyncValueProvider).value!)
        .update({'name': name});
  }

  Future<void> deleteUser() async {
    await userDocRef(userId: _ref.read(userIdAsyncValueProvider).value!)
        .delete();
    await _ref.read(authUserProvider).value!.delete();
    await authRef.signOut();
    print('🐯 ユーザーを削除しました !!!');
  }

  Future<List<UserEntity>> readUserList() {
    return usersRef.get().then((qs) {
      return qs.docs.map((qds) => qds.data()).toList();
    });
  }
}
