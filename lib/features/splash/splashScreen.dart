import 'dart:async';
import 'package:flutter/material.dart';
import 'package:playerhub/core/ApiService/TokenStorage.dart';
import 'package:playerhub/core/routes/route_name.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool showText = false;

  @override
  void initState() {
    super.initState();

    // Start showing text after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showText = true;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      final TokenStorage tokenStorage = TokenStorage();
      final String? token = await tokenStorage.getToken();

      if (token != null && token.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.parentScreen,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteNames.loginScreenOrSignUp,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.asset(
              "assets/icons/png/logo.png",
              width: 150, // Add width for better control
              height: 150, // Add height for better control
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: showText ? 1.0 : 0.0,
              child: const Text(
                "Your all-in-one team management solution",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
