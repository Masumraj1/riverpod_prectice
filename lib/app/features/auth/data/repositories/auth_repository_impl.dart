import 'dart:async';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> signIn(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return UserModel(id: '1', email: email);
  }

  @override
  Future<User> signUp(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return UserModel(id: '2', email: email);
  }
}
