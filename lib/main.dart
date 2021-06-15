import 'package:flutter/material.dart';

import 'app/evaluation/instructor_page.dart';
import 'app/home/home.dart';
import 'app/sign_in/sign_in_page.dart';
import 'app/sign_in/sign_up_page.dart';
import 'app/sign_in/forget_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        'SignUp': (context) => SignUpPage(),
        'home': (context) => Home(),
        'forgetPass': (context) => ForgetPassword(),
        'instructor':(context) => Instructor(),
      },
    );
  }
}
