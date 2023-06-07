import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/refs/user_refs.dart';

class UserRepository {
  Future<void> createUser(UserEntity user) async {
    await userDocRef(userId: user.userId).set(user);
  }

  Stream<UserEntity> readUser() {
    return userDocRef(userId: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snap) => snap.data()!);
  }

  Future<void> updateUser(String name) async {
    await userDocRef(userId: FirebaseAuth.instance.currentUser!.uid)
        .update({'name': name});
  }

  Future<void> deleteUser() async {
    await userDocRef(userId: FirebaseAuth.instance.currentUser!.uid).delete();
    await FirebaseAuth.instance.currentUser!.delete();
    await FirebaseAuth.instance.signOut();
    print('🐯 ユーザーを削除しました !!!');
  }

  Future<List<UserEntity>> readUserList() {
    return usersRef.get().then((qs) {
      return qs.docs.map((qds) => qds.data()).toList();
    });
  }
}
