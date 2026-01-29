import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/core/widget/customButton.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/widget/CustomTextFIeld.dart';
import '../provider/loginProvider.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login to Your Account",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 20),

            // Email
            CustomTextField(
              controller: emailController,
              hintText: "Enter your email",
            ),

            // Password
            const SizedBox(height: 10),
            CustomTextField(
              controller: passwordController,
              hintText: "Enter your password",
              isPassword: true,
            ),

            const SizedBox(height: 50),
            state.loading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
              text: "Log In",
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              submit: () async {
                await ref
                    .read(loginProvider.notifier)
                    .login(emailController.text,
                    passwordController.text);

                if (ref.read(loginProvider).user != null) {
                  Navigator.pushNamed(
                      context, RouteNames.homeScreen);
                } else if (ref.read(loginProvider).error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                      Text(ref.read(loginProvider).error ?? "Error"),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
