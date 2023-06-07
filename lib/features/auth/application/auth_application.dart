import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/domain/i_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/infrastructure/i_auth_impl.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/infrastructure/repos/auth_repo.dart';

final authApplicationProvider =
    Provider.autoDispose<AuthApplicationService>((ref) {
  final authRepo = AuthRepository();
  final authImpl = AuthImpl(repo: authRepo);
  return AuthApplicationService(authManager: authImpl);
});

class AuthApplicationService {
  AuthApplicationService({
    required this.authManager,
  });

  final IAuthService authManager;

  Future<void> signUP({
    required String email,
    required String password,
    required String name,
  }) async {
    print('🐯 AuthCommand signUp IN !!! ');
    try {
      await authManager.signUp(email, password);
    } on FirebaseAuthException {
      print('🐯 signUP  失敗 !!! ');
      //rethrowはその例外をさらに外側のcatchブロックに渡す.
      //この記述でScreen側のtryに例外が伝わるので画面遷移しない。
      rethrow;
    }
  }

  Future<void> signIN({required String email, required String password}) async {
    print('🐯 AuthCommand signIN IN !!! ');
    try {
      await authManager.signIn(email, password);
    } on FirebaseAuthException {
      print('🐯 signIN  失敗 !!! ');
      rethrow;
    }
  }

  Future<void> signOut() async {
    print('🐯 AuthCommand signOut IN !!! ');
    try {
      await authManager.signOut();
    } on FirebaseAuthException {
      print('🐯 signOut  失敗 !!! ');
      rethrow;
    }
  }
}
