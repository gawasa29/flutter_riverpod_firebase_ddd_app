import 'package:firebase_auth/firebase_auth.dart';

//リポジトリパターンのクラス
//データベース処理を分離し、抽象化してビジネスロジックのコードを見通しを良くするための設計パターンです。
class AuthRepository {
  AuthRepository({required this.firebaseAuth});
  final FirebaseAuth firebaseAuth;
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    print('🐯  AuthRepository signUp IN !!! ');
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    print('🐯  AuthRepository signIn IN !!! ');
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    print('🐯  AuthRepository signOut IN !!! ');
    await FirebaseAuth.instance.signOut();
  }
}
