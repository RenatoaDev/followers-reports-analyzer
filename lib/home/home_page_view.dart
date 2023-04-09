import 'package:flutter/material.dart';
import 'package:followers_reports_analyzer/auth/auth_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffcdb2),
      appBar: AppBar(
        backgroundColor: const Color(0xffffcdb2),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Seja bem vindo ao\n',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Followers Reports Analyzer\n\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: 'Descubra:\n',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: ' • Quem deixou de lhe seguir no Instagram.\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child:
                    Text('Faça login com sua conta do Instagram para começar'),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthView()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(300, 44)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffe5989b)),
                  ),
                  icon: Image.asset(
                    'assets/ig_logo.png',
                    height: 30,
                    width: 30,
                  ),
                  label: const Text('Entrar com Instagram'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
