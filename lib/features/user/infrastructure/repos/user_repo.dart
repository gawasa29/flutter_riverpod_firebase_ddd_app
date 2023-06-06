import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';

class UserRepository {
  UserRepository({
    required this.ssot,
  });
  final CollectionReference<UserEntity> ssot;

  Future<void> createUser(UserEntity user) async {
    await ssot.doc(user.userId).set(user);
  }

  Stream<UserEntity> readUser() {
    return ssot
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snap) => snap.data()!);
  }

  Future<void> updateUser(String name) async {
    await ssot
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'name': name});
  }

  Future<void> deleteUser() async {
    await ssot.doc(FirebaseAuth.instance.currentUser!.uid).delete();
    await FirebaseAuth.instance.currentUser!.delete();
    await FirebaseAuth.instance.signOut();
    print('🐯 ユーザーを削除しました !!!');
  }

  Future<List<UserEntity>> readUserList() {
    return ssot.get().then((qs) {
      return qs.docs.map((qds) => qds.data()).toList();
    });
  }
}
