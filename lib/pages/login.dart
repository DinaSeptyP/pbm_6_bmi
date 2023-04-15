import 'package:flutter/material.dart';

import '../routes.dart';
import 'homepage.dart';
import 'register.dart';
// ignore: depend_on_referenced_packages

void Warning({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color.fromRGBO(46, 77, 66, 1),
    content: Row(children: [
      Expanded(child: Text(message)),
    ]),
    behavior: SnackBarBehavior.floating,
  ));
}

class Login extends StatelessWidget {
  const Login({super.key, this.data});

  final Map? data;
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/app-icon.png';
    final email = TextEditingController();
    final password = TextEditingController();
    Map? _data;
    if (data != null) {
      _data = data;
      print(_data);
      print(_data?['email']);
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 252, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 50),
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/splash.png')),
              ),
            ),
            const Text.rich(
              TextSpan(
                  text: 'Login Page', // default text style
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Color.fromRGBO(60, 98, 85, 1))),
            ),
            const Text.rich(
              TextSpan(
                  text: ' ', // default text style
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Color.fromRGBO(60, 98, 85, 1))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(60, 98, 85, 1)),
                        borderRadius: BorderRadius.circular(15.0)),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(60, 98, 85, 1)),
                        borderRadius: BorderRadius.circular(15.0)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(60, 98, 85, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  if (email.text == '' && password.text == '') {
                    Warning(
                        context: context,
                        message: 'Email/password can\'t be empty');
                  } else {
                    if (email.text == _data?['email'] &&
                        password.text == _data?['password']) {
                      Navigator.pushReplacementNamed(
                          context, HomePage.routeName,
                          arguments: LoginScreenArguments({
                            'username': username.text,
                            'email': email.text,
                            'password': password.text,
                          }));
                    } else {
                      Warning(
                          context: context, message: 'Wrong email or password');
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(60, 98, 85, 1),
                    fontSize: 16),
                children: <InlineSpan>[
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Register',
                          style: TextStyle(
                              color: Color.fromRGBO(60, 98, 85, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
