import 'package:flutter/material.dart';
import 'package:psciapp/auth_check.dart';
import 'package:psciapp/pages/forgot_password.dart';
import 'package:psciapp/pages/login_page.dart';
import 'package:psciapp/pages/question_page.dart';
import 'package:psciapp/pages/register_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of yout application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PsicApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      initialRoute: '/authCheck',
      routes: {
        '/authCheck':(context) => const AuthCheck(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgotPassword':(context) => const ForgotPassword(),
        '/questionPage':(context) => const QuestionPage(),
      },
    );
  }
}