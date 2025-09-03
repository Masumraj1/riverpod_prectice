import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> signIn(String email, String password) async {
    // Dummy API call simulation
    await Future.delayed(const Duration(seconds: 2));

    if (email == "test@test.com" && password == "123456") {
      return UserModel(id: "1", email: email);
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
