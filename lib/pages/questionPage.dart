import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:psciapp/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

enum Emotion { triste, chateado, apatico, contente, feliz }

class _QuestionPageState extends State<QuestionPage> {
  Emotion? emotion = Emotion.apatico;
  final formKey = GlobalKey<FormState>();
  final pontoAlto = TextEditingController();
  final pontoBaixo = TextEditingController();
  bool? valid = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // pegando o ID do usuário logado
  final user = FirebaseAuth.instance.currentUser?.uid;
  // pegando a data do dia em que o formulário foi respondido
  String data = DateFormat.MEd().format(DateTime.now());
  var id = const Uuid();
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
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Defina como foi o seu humor nesse dia',
                        style:
                            TextStyle(color: Color(0XFF66626F), fontSize: 16)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/emoji.png'),
                ]),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Radio<Emotion>(
                                  value: Emotion.triste,
                                  groupValue: emotion,
                                  onChanged: (Emotion? value) {
                                    setState(() {
                                      emotion = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<Emotion>(
                                  value: Emotion.chateado,
                                  groupValue: emotion,
                                  onChanged: (Emotion? value) {
                                    setState(() {
                                      emotion = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<Emotion>(
                                  value: Emotion.apatico,
                                  groupValue: emotion,
                                  onChanged: (Emotion? value) {
                                    setState(() {
                                      emotion = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio<Emotion>(
                                  value: Emotion.contente,
                                  groupValue: emotion,
                                  onChanged: (Emotion? value) {
                                    setState(() {
                                      emotion = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio<Emotion>(
                                  value: Emotion.feliz,
                                  groupValue: emotion,
                                  onChanged: (Emotion? value) {
                                    setState(() {
                                      emotion = value;
                                    });
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cite, pelo menos um ponto alto do seu dia:',
                        style:
                            TextStyle(color: Color(0XFF66626F), fontSize: 16)),
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
                    controller: pontoAlto,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Seu dia teve algum ponto baixo?',
                        style:
                            TextStyle(color: Color(0XFF66626F), fontSize: 16)),
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
                    controller: pontoBaixo,
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
                          String humor = "Apático";
                            if (emotion == Emotion.contente) {
                              humor = "Contente";
                            } else if (emotion == Emotion.chateado) {
                              humor = "Chateado";
                            } else if (emotion == Emotion.apatico) {
                              humor = "Apático";
                            } else if (emotion == Emotion.feliz) {
                              humor = "Feliz";
                            } else if (emotion == Emotion.triste) {
                              humor = "Triste";
                            }
                          valid = formKey.currentState?.validate();
                          if (valid == true) {
                            firestore
                                .collection("users")
                                .doc(user).collection("Formulários").doc(id.v1())
                                .set({
                              "Ponto alto": pontoAlto.text,
                              "Ponto baixo": pontoBaixo.text,
                              "Humor": humor,
                              "Dia": data,
                            });
                            context.read<AuthService>().logout();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Formulário enviado!')));
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0XFFCBE8DD)),
                        ),
                        child: const Text(
                          'Enviar formulário',
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
}
