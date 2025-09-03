import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_up.dart';
import '../../domain/entities/user.dart';

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl());

final signInProvider = Provider((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignIn(repo);
});

final signUpProvider = Provider((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignUp(repo);
});

final authStateProvider = StateProvider<User?>((ref) => null);
