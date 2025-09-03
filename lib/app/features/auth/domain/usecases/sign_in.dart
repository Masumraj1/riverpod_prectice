import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignIn implements UseCase<User, SignInParams> {
  final AuthRepository repository;

  SignIn(this.repository);

  @override
  Future<User> call(SignInParams params) {
    return repository.signIn(params.email, params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams(this.email, this.password);
}
