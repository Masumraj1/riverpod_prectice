import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in.dart';
import '../../data/repositories/auth_repository_impl.dart';

// Repository Provider
final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl();
});

// UseCase Provider
final signInUseCaseProvider = Provider<SignIn>((ref) {
  return SignIn(ref.read(authRepositoryProvider));
});

// Auth State
class AuthState {
  final bool loading;
  final User? user;
  final String? error;

  AuthState({this.loading = false, this.user, this.error});
}

// StateNotifier
class AuthNotifier extends StateNotifier<AuthState> {
  final SignIn signIn;

  AuthNotifier(this.signIn) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = AuthState(loading: true);
    try {
      final user = await signIn(SignInParams(email, password));
      state = AuthState(user: user);
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  void logout() {
    state = AuthState();
  }
}

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(signInUseCaseProvider));
});
