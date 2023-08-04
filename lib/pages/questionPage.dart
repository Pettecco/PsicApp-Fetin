import 'package:flutter/material.dart';
import 'package:psciapp/classes/emotionCheck.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/services/auth_service.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  // This widget is the root of yout application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0XFF66626F),
        title: const Text(
          'Questionário do dia',
          style: TextStyle(color: Color(0XFF66626F)),
        ),
        backgroundColor: const Color(0XFFCBE8DD),
        foregroundColor: const Color(0XFF66626F),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        color: const Color(0xFFFEE8E2),
        child: ListView(children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Defina como foi o seu humor nesse dia',
                  style: TextStyle(color: Color(0XFF66626F), fontSize: 16)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Image.asset('assets/emoji.png'),
          ]),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EmotionCheck(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cite, pelo menos um ponto alto do seu dia:',
                  style: TextStyle(color: Color(0XFF66626F), fontSize: 16)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0XFF66626F),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xFFFFBFA8),
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: 10,
              autofocus: false,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 42, 40, 46)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Seu dia teve algum ponto baixo?',
                  style: TextStyle(color: Color(0XFF66626F), fontSize: 16)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xFFFFBFA8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0XFF66626F),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: 10,
              autofocus: false,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 42, 40, 46)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 60,
              child: ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {
                      context.read<AuthService>().logout();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Formulário enviado!')));
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0XFFCBE8DD)),
                  ),
                  child: const Text(
                    'Enviar formulário',
                    style: TextStyle(color: Color(0XFF66626F), fontSize: 17),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
