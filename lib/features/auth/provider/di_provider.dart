import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/application/auth_command.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/infrastructure/i_auth_impl.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/infrastructure/repos/auth_repo.dart';

final authCommandProvider = Provider.autoDispose<AuthCommand>((ref) {
  final firebaseAuth = FirebaseAuth.instance;
  final authRepo = AuthRepository(firebaseAuth: firebaseAuth);
  final authImpl = AuthImpl(repo: authRepo);
  return AuthCommand(authManager: authImpl);
});
