import 'package:flutter/cupertino.dart';
import 'package:playerhub/core/routes/route_name.dart';
import 'package:playerhub/features/login/presentaion/screen/loginScreen.dart';
import 'package:playerhub/features/parent/parentScreen.dart';
import 'package:playerhub/features/signup/presentaion/screen/SignUpScreen.dart';
import 'package:playerhub/features/splash/splashScreen.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/signUpOrLoginScreen.dart';

class AppRoutes {

  static final Map<String,WidgetBuilder> routes ={

    RouteNames.splashScreen: (context) => const Splashscreen(),
    RouteNames.homeScreen:(context) => const HomePage(),
    RouteNames.loginScreenOrSignUp:(context) => const SignUpOrLoginScreen(),
    RouteNames.loginScreen:(context) =>  LoginScreen(),
    RouteNames.signUpScreen:(context) =>  SignUpScreen(),
    RouteNames.parentScreen:(context) => const ParentScreen()

  };

}