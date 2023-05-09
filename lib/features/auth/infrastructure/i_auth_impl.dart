import 'package:flutter_riverpod_firebase_ddd_app/features/auth/domain/i_auth.dart';

import 'repos/auth_repo.dart';

//Implは実装の意味
class AuthImpl extends IAuthService {
  AuthImpl({
    required this.repo,
  });
  //repoはレポジトリの略
  AuthRepository repo;
  @override
  Future<void> signIn(String email, String password) async {
    await repo.signIn(email: email, password: password);
  }

  @override
  Future<void> signUp(
    String email,
    String password,
  ) async {
    print('🐯  AuthImpl signUp IN !!! ');
    await repo.signUp(
      email: email,
      password: password,
    );
  }
}
