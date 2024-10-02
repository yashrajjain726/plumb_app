import 'package:flutter/material.dart';
import 'package:plum_app/features/greetings/presentation/pages/greeting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Magic Plum Tree',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const GreetingsPage(),
    );
  }
}
