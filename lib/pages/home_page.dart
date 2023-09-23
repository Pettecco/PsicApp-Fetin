import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/logo.png'),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  height: 65,
                  child: ButtonTheme(
                      child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/questionPage'),
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0XFFCBE8DD)),
                    ),
                    child: const Text(
                      "Responder Questionário",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  height: 65,
                  child: ButtonTheme(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0XFFCBE8DD)),
                    ),
                    child: const Text(
                      "Enviar Respostas",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
