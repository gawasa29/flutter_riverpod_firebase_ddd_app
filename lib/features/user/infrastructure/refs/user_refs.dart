import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';

final CollectionReference<UserEntity> usersRef =
    FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

/// User ドキュメントの参照。
DocumentReference<UserEntity> userDocRef({
  required String userId,
}) =>
    usersRef.doc(userId);
