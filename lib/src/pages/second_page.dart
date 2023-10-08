import 'package:aula05/src/widgets/botao_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  Future<String> buscarPokemon() async {
    var pokedexnum = Random().nextInt(699) + 1;
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokedexnum');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var nome = await jsonDecode(response.body)['name'];
      var tipo = await jsonDecode(response.body)['types'][0]['type']['name'];
      var url = 'https://pokeapi.co/api/v2/pokemon/$nome'; 
      String pokemon = 
        'Nome: $nome\n\n'
        'Tipo: $tipo\n\n'
        'URL: $url\n\n';
      return pokemon;
    } else {
      throw Exception('Falha ao buscar Pokémon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 76, 110, 214),
        title: const Text('Navegação + Pacotes + API',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ),
      body: FutureBuilder(
        future: buscarPokemon(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                BotaoWidget(
                  texto: 'Voltar',
                  acaoBotao: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
}