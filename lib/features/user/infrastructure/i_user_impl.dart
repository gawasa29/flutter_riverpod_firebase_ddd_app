import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/i_user.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/repos/user_repo.dart';

class UserImpl extends IUserService {
  UserImpl({
    required this.repo,
  });

  UserRepository repo;

  @override
  Future<void> createUser(String name) async {
    final user = UserEntity(
      name: name,
      userId: FirebaseAuth.instance.currentUser!.uid,
    );

    await repo.createUser(user);
  }

  @override
  Stream<UserEntity> readUser() {
    try {
      return repo.readUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(String name) async {
    await repo.updateUser(name);
  }

  @override
  Future<void> deleteUser() async {
    await repo.deleteUser();
  }
}
