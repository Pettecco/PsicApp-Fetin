import 'package:flutter/material.dart';
import 'package:psciapp/pages/loginPage.dart';
import 'package:psciapp/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/pages/questionPage.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginPage();
    } else {
      return const QuestionPage();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
