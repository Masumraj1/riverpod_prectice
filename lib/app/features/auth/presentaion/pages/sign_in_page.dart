import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_path.dart';
import '../providers/auth_providers.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign In", style: TextStyle(fontSize: 24.sp)),
            SizedBox(height: 20.h),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                final signIn = ref.read(signInProvider);
                final user = await signIn(
                  _emailController.text,
                  _passwordController.text,
                );
                ref.read(authStateProvider.notifier).state = user;
                // context.push(RoutePath.home.addBasePath);
              },
              child: Text("Sign In"),
            ),
            TextButton(
              onPressed: () =>  context.push(RoutePath.signUp.addBasePath),
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
