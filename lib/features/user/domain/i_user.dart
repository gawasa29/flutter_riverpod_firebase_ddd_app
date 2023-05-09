import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';

abstract class IUserService {
  Future<void> createUser(String name);
  Stream<UserEntity> readUser();
  Future<void> updateUser(String name);
  Future<void> deleteUser();
}
