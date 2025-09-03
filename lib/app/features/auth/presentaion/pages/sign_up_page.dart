import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_path.dart';
import '../providers/auth_providers.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

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
            Text("Sign Up", style: TextStyle(fontSize: 24.sp)),
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
                final signUp = ref.read(signUpProvider);
                final user = await signUp(
                  _emailController.text,
                  _passwordController.text,
                );
                ref.read(authStateProvider.notifier).state = user;
                // context.push(RoutePath.home.addBasePath);
              },
              child: Text("Sign Up"),
            ),
            TextButton(
              onPressed: () =>  context.push(RoutePath.signIn.addBasePath),
              child: Text("Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
