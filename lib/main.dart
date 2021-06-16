import 'package:flutter/material.dart';
import 'package:petroly/providers/instructor_Provider.dart';
import 'package:petroly/providers/Instructors_list.dart';
import 'package:provider/provider.dart';
import 'app/evaluation/evaluation.dart';
import 'app/evaluation/instructor_page.dart';
import 'app/home/home.dart';
import 'app/sign_in/sign_in_page.dart';
import 'app/sign_in/sign_up_page.dart';
import 'app/sign_in/forget_password.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstructorProviderx()),
        ChangeNotifierProvider(create: (_) => InstructorList()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  initialRoute: '/SignIn',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/SignIn': (context) => SignInPage(),
        '/SignUp': (context) => SignUpPage(),
        '/home': (context) => Home(),
        '/forgetPass': (context) => ForgetPassword(),
        '/instructor': (context) => Instructor(),
        '/evalation': (context) => Evalation(),
      },
      home: SignInPage(),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<InstructorProviderx>().instructors;
    return MaterialApp(
      title: 'Petroly1',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // initialRoute: '/SignIn',
      // routes: {
      //   '/SignIn': (context) => SignInPage(),
      //   '/SignUp': (context) => SignUpPage(),
      //   '/home': (context) => Home(),
      //   '/forgetPass': (context) => ForgetPassword(),
      //   '/instructor': (context) => Instructor(),
      //   '/evalation': (context) => Evalation(),
      // },
      home: SignInPage(),
    );

    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => InstructorProviderx()),
    //   ],
    //   child: MaterialApp(
    //     title: 'Petroly1',
    //     theme: ThemeData(
    //       primarySwatch: Colors.green,
    //     ),
    //     initialRoute: '/SignIn',
    //     routes: {
    //       '/SignIn': (context) => SignInPage(),
    //       '/SignUp': (context) => SignUpPage(),
    //       '/home': (context) => Home(),
    //       '/forgetPass': (context) => ForgetPassword(),
    //       '/instructor': (context) => Instructor(),
    //       '/evalation': (context) => Evalation(),
    //     },
    //     home: SignInPage(),
    //   ),
    // );
  }
}*/
