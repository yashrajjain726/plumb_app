import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum_app/features/greetings/presentation/pages/greeting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Magic Plum Tree',
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        ),
      ),
      home: GreetingsPage(),
    );
  }
}
