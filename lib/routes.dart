import 'package:flutter/material.dart';

import 'pages/bmi.dart';
import 'pages/homepage.dart';
import 'pages/login.dart';
import 'pages/register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Register.routeName:
        return MaterialPageRoute(builder: (_) => Register());

      case Login.routeName:
        final args = settings.arguments as LoginScreenArguments;
        return MaterialPageRoute(builder: (_) => Login(data: args.data));

      case HomePage.routeName:
        final args = settings.arguments as LoginScreenArguments;
        return MaterialPageRoute(builder: (_) => HomePage(data: args.data));

      case BMI.routeName:
        return MaterialPageRoute(builder: (_) => const BMI());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class LoginScreenArguments {
  final Map data;

  LoginScreenArguments(this.data);
}
