import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/services/auth_service.dart';
import 'package:psciapp/models/remeberMe.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool? valid = false;

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        color: const Color(0xFFFEE8E2),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/logo.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'E-mail',
                    style: TextStyle(color: Color(0XFF66626F), fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: email,
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o email corretamente!';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        IconData(0xe22a, fontFamily: 'MaterialIcons'),
                        color: Colors.black26,
                      ),
                      hintText: 'Insira seu e-mail',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Senha',
                    style: TextStyle(color: Color(0XFF66626F), fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white),
                  child: TextFormField(
                    controller: senha,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                        color: Colors.black26,
                      ),
                      hintText: 'Insira sua senha',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if (value.length < 6) {
                        return 'Sua senha deve ter no mínimo 6 caracteres!';
                      }
                      return null;
                    },
                    autofocus: false,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RememberMe(),
                          Text(
                            'Lembre-se de mim',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/forgotPassword'),
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 250,
                    height: 65,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        onPressed: () {
                          valid = formKey.currentState?.validate();
                          if (valid == true) {
                            login();
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0XFFCBE8DD)),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ainda não tem uma conta?',
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/register'),
                        child: const Text(
                          'INSCREVA-SE',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
