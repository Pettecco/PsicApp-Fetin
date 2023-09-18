import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmSenha = TextEditingController();
  bool? valid = false;

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFCBE8DD),
        foregroundColor: Colors.black,
        title: const Text(
          'Registre-se',
          style: TextStyle(color: Color(0XFF66626F)),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 40,
            right: 40,
            bottom: 10,
          ),
          color: const Color(0xFFFEE8E2),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
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
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'E-mail obrigatório!';
                        }
                        return null;
                      },
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
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
                    height: 25,
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
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: senha,
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(fontSize: 20),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Senha obrigatória';
                        } else if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                          color: Colors.black26,
                        ),
                        hintText: 'Digite sua senha',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Confime sua senha',
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
                      controller: confirmSenha,
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(fontSize: 20),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Senha obrigatória';
                        } else if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres!';
                        } else if(value != senha.text){
                          return 'As senhas devem ser iguais!';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                          color: Colors.black26,
                        ),
                        hintText: 'Digite sua senha',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                      height: 65,
                      child: ButtonTheme(
                        child: ElevatedButton(
                          onPressed: () {
                            valid = formKey.currentState?.validate();
                            if (valid == true) {
                              registrar();
                              Navigator.of(context).pushNamed('/login');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Registro concluído com sucesso!')));
                            }
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0XFFCBE8DD)),
                          ),
                          child: const Text(
                            'CRIAR MINHA CONTA',
                            style: TextStyle(
                                color: Color(0XFF66626F), fontSize: 17),
                          ),
                        ),
                      )),
                ]),
              )
            ],
          )),
    );
  }
}
