import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/infrastructure/refs/auth_refs.dart';

//リポジトリパターンのクラス
//データベース処理を分離し、抽象化してビジネスロジックのコードを見通しを良くするための設計パターンです。
class AuthRepository {
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    print('🐯  AuthRepository signUp IN !!! ');
    await authRef.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    print('🐯  AuthRepository signIn IN !!! ');
    await authRef.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    print('🐯  AuthRepository signOut IN !!! ');
    await FirebaseAuth.instance.signOut();
  }
}
