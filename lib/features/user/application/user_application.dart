import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/i_user.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/i_user_impl.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/repos/user_repo.dart';

final userApplicationProvider =
    Provider.autoDispose<UserApplicationService>((ref) {
  final ssot = FirebaseFirestore.instance.collection('users').withConverter(
        fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
        toFirestore: (data, _) => data.toJson(),
      );
  final userRepo = UserRepository(ssot: ssot);
  final userImpl = UserImpl(repo: userRepo);
  return UserApplicationService(userManager: userImpl);
});

final userQueryProvider = StreamProvider.autoDispose<UserEntity>((ref) {
  print('🐯 userQueryProvider IN !!! ');
  return ref.watch(userApplicationProvider).readUser();
});

final userListQueryProvider =
    FutureProvider.autoDispose<List<UserEntity>>((ref) {
  print('🐯 userListQueryProvider IN !!! ');
  return ref.watch(userApplicationProvider).readUserList();
});

class UserApplicationService {
  UserApplicationService({
    required this.userManager,
  });

  final IUserService userManager;

  Future<void> createUser({
    required String name,
  }) async {
    print('🐯 UserApplication createUser IN !!! ');
    try {
      await userManager.createUser(name);
    } on FirebaseAuthException {
      print('🐯 createUser  失敗 !!! ');
      rethrow;
    }
  }

  Stream<UserEntity> readUser() {
    print('🐯 UserApplication readUser IN !!! ');
    try {
      return userManager.readUser();
    } catch (e) {
      print('🐯 readUser  失敗 !!! ');
      rethrow;
    }
  }

  Future<void> updateUser({
    required String name,
  }) async {
    print('🐯 UserApplication updateUser IN !!! ');
    try {
      await userManager.updateUser(name);
    } catch (e) {
      print('🐯 updateUser  失敗 !!! ');
      rethrow;
    }
  }

  Future<void> deleteUser() async {
    print('🐯 UserApplication deleteUser IN !!! ');
    try {
      await userManager.deleteUser();
    } catch (e) {
      print('🐯 deleteUser  失敗 !!! ');
      rethrow;
    }
  }

  Future<List<UserEntity>> readUserList() {
    print('🐯 UserApplication readUserList IN !!! ');
    try {
      return userManager.readUserList();
    } catch (e) {
      print('🐯 readUserList  失敗 !!! ');
      rethrow;
    }
  }
}
