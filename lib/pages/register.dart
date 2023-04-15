import 'dart:io';

import 'package:flutter/material.dart';

import '../routes.dart';
import 'login.dart';

void Warning({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color.fromRGBO(46, 77, 66, 1),
    content: Row(children: [
      Expanded(child: Text(message)),
    ]),
    behavior: SnackBarBehavior.floating,
  ));
}
// ignore: depend_on_referenced_packages

final email = TextEditingController();
final password = TextEditingController();
final username = TextEditingController();

class Register extends StatelessWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 252, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Center(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/splash.png')),
                ),
              ),
            ),
            const Text.rich(
              TextSpan(
                  text: 'Register Page', // default text style
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(60, 98, 85, 1)),
                        borderRadius: BorderRadius.circular(15.0)),
                    labelText: 'Username',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                    hintText: 'Enter your username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(60, 98, 85, 1)),
                        borderRadius: BorderRadius.circular(15.0)),
                    labelText: 'Email',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(60, 98, 85, 1)),
                        borderRadius: BorderRadius.circular(15.0)),
                    labelText: 'Password',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(60, 98, 85, 1)),
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(60, 98, 85, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (username.text == "" &&
                      password.text == "" &&
                      email.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromRGBO(46, 77, 66, 1),
                        content: Text(
                            'Username, email and password can\'t be empty'),
                      ),
                    );
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      Login.routeName,
                      arguments: LoginScreenArguments(
                        {
                          "username": username.text,
                          "email": email.text,
                          "password": password.text,
                        },
                      ),
                    );
                  }
                  // Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(60, 98, 85, 1),
                    fontSize: 16),
                children: <InlineSpan>[
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login',
                          style: TextStyle(
                              color: Color.fromRGBO(60, 98, 85, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            //       ]),
            //     )),
          ],
        ),
      ),
    );
  }
}
