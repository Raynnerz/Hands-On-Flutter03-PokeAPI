import 'package:aula05/src/pages/second_page.dart';
import 'package:aula05/src/widgets/botao_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 76, 110, 214),
        title: const Text('Navegação + Pacotes + API',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotaoWidget(
              texto: 'Buscar pokemon aleatório',
              acaoBotao: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage(),),
                );
              },
            ),
          ]
        )
      ),
    );
  }
}
