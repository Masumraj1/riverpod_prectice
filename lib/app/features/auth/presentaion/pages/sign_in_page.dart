import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/routes/route_path.dart';
import '../providers/auth_providers.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 20),
            authState.loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).login(
                  emailController.text,
                  passwordController.text,
                );

                if (ref.read(authProvider).user != null) {
                  context.push(RoutePath.home.addBasePath);
                }
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () => context.push(RoutePath.signUp.addBasePath),
              child: const Text("Don't have an account? Sign Up"),
            ),
            if (authState.error != null)
              Text(authState.error!, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
