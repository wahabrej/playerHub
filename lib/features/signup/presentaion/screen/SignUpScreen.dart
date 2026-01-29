import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playerhub/core/routes/route_name.dart';

import '../../../../core/widget/CustomTextFIeld.dart';
import '../../../../core/widget/customButton.dart';
import '../provider/SignUpProvider.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signupProvider);

    ref.listen(signupProvider, (previous, next) {
      if (next.result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup Successful")),
        );
      }

      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Admin Account",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 20.h),

            CustomTextField(
              hintText: "Enter Full Name",
              controller: nameController,
            ),
            CustomTextField(
              hintText: "Enter Email",
              controller: emailController,
            ),
            CustomTextField(
              hintText: "Enter Phone",
              controller: phoneController,
            ),
            CustomTextField(
              hintText: "Enter Password",
              isPassword: true,
              controller: passwordController,
            ),
            CustomTextField(
              hintText: "Confirm Password",
              isPassword: true,
              controller: confirmPasswordController,
            ),

            SizedBox(height: 30.h),

            signupState.loading
                ? const Center(
              child: CircularProgressIndicator(color: Colors.yellow),
            )
                : CustomButton(
              text: "Sign Up",
              backgroundColor: Colors.yellow,
              textColor: Colors.black,
              submit: () {
                if (passwordController.text !=
                    confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password does not match"),
                    ),
                  );

                  Navigator.pushNamed(context, RouteNames.loginScreen);
                  return;
                }

                ref.read(signupProvider.notifier).signup(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  phone: phoneController.text.trim(),
                  password: passwordController.text.trim(),
                  role: "admin",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
