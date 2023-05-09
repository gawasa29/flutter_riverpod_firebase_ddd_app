import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/i_user_impl.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/repos/user_repo.dart';

final userQueryProvider = StreamProvider.autoDispose<UserEntity>((ref) {
  print('🐯 userQueryProvider IN !!! ');
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final userRepo = UserRepository(
      firebaseAuth: firebaseAuth, firebaseFirestore: firebaseFirestore);
  final userImpl = UserImpl(repo: userRepo);
  return userImpl.readUser();
});
