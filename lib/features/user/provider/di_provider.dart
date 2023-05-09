import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/application/user_command.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/i_user_impl.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/infrastructure/repos/user_repo.dart';

final userCommandProvider = Provider.autoDispose<UserCommand>((ref) {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final userRepo = UserRepository(
      firebaseAuth: firebaseAuth, firebaseFirestore: firebaseFirestore);
  final userImpl = UserImpl(repo: userRepo);
  return UserCommand(userManager: userImpl);
});
