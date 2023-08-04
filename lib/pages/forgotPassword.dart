import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool? valid = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0XFF66626F),
        title: const Text(
          'Recuperação de senha',
          style: TextStyle(color: Color(0XFF66626F)),
        ),
        backgroundColor: const Color(0XFFCBE8DD),
        foregroundColor: const Color(0XFF66626F),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: 16,
          right: 16,
          bottom: 10,
        ),
        color: const Color(0xFFFEE8E2),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/logo.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Color(0XFF66626F), fontSize: 15),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (String? email) {
                      if (email == null || email.isEmpty) {
                        return 'Insira um e-mail válido!';
                      }
                      return null;
                    },
                    autofocus: false,
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
                  height: 30,
                ),
                SizedBox(
                    height: 60,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        onPressed: () {
                          valid = formKey.currentState?.validate();
                          if (valid == true) {
                            resetPassword();
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'E-mail para recuperação de senha enviado!')));
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0XFFCBE8DD)),
                        ),
                        child: const Text(
                          'Enviar e-mail com a senha',
                          style:
                              TextStyle(color: Color(0XFF66626F), fontSize: 17),
                        ),
                      ),
                    )),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
  }
}
