import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';

class UserRepository {
  UserRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

//SSOTはここでしか使わないからプライベート
  Future<CollectionReference<UserEntity>> _userCollectionRefSSOT() async {
    print('🐯  UserRepository userCollectionRef IN !!! ');
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
  }

  Future<void> createUser(UserEntity user) async {
    final collectionRef = await _userCollectionRefSSOT();
    await collectionRef.doc(user.userId).set(user);
  }

  Stream<UserEntity> readUser() async* {
    final collectionRef = await _userCollectionRefSSOT();

    final stream = collectionRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snap) => snap.data()!);

    // Streamをリッスンし、それぞれのUserEntityをyieldする
    await for (final userEntity in stream) {
      yield userEntity;
    }
  }

  Future<void> updateUser(String name) async {
    final collectionRef = await _userCollectionRefSSOT();
    await collectionRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'name': name});
  }

  Future<void> deleteUser() async {
    final collectionRef = await _userCollectionRefSSOT();
    await collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).delete();
    await FirebaseAuth.instance.currentUser!.delete();
    await FirebaseAuth.instance.signOut();
    print('🐯 ユーザーを削除しました !!!');
  }
}
