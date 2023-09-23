import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/services/auth_service.dart';

class ConfirmForm extends StatelessWidget {
  const ConfirmForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: 16,
          right: 16,
          bottom: 10,
        ),
        color: const Color(0xFFFEE8E2),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Formulário respondido!',
                    style: TextStyle(
                        color: Color(0XFF66626F),
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 60,
                child: ButtonTheme(
                  child: ElevatedButton(
                    onPressed: () {
                      /*Inserir aqui o código do tio da nana*/
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0XFFCBE8DD)),
                    ),
                    child: const Text(
                      'Enviar Respostas',
                      style: TextStyle(color: Color(0XFF66626F), fontSize: 17),
                    ),
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 60,
                child: ButtonTheme(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthService>().logout();
                      Navigator.of(context).pushNamed('/login');
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0XFFCBE8DD)),
                    ),
                    child: const Text(
                      'Sair',
                      style: TextStyle(color: Color(0XFF66626F), fontSize: 17),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
