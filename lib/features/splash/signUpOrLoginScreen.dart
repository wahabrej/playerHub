import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playerhub/core/routes/route_name.dart';

import '../../core/widget/customButton.dart';

class SignUpOrLoginScreen extends StatelessWidget {
  const SignUpOrLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/icons/png/logo.png")),
          SizedBox(height: 60),
          CustomButton(
            text: "Sign Up",
            backgroundColor: Colors.yellowAccent,
            textColor: Colors.black,
            submit: () {
              Navigator.pushNamed(context, RouteNames.signUpScreen);
            },
          ),
          SizedBox(height: 20),

          CustomButton(
            text: "Log In",
            backgroundColor: Colors.black,
            textColor: Colors.yellow,
            submit: () {
              Navigator.pushNamed(context, RouteNames.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
