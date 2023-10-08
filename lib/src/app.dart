import 'package:aula05/src/pages/home_page.dart';
import 'package:aula05/src/pages/second_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/secondpage': (context) => SecondPage()
      },
    );
  }
}