import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum_app/features/plums/presentation/plumb_book_page.dart';
import '../../data/greeting_data_source.dart';
import '../../domain/greeting.dart';
import '../../../plums/domain/plum.dart';

class GreetingsPage extends StatefulWidget {
  @override
  _GreetingsPageState createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage>
    with SingleTickerProviderStateMixin {
  final GreetingDataSource _greetingDataSource = GreetingDataSource();
  List<Greeting> greetings = [];
  List<Plum> plums = [];
  int currentIndex = 0;
  List<Plum> unlockedPlums = [];

  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    greetings = _greetingDataSource.getGreetings();
    plums = _greetingDataSource.getPlums();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeInAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onCorrectGreeting() {
    setState(() {
      unlockedPlums.add(plums[currentIndex]);
      if (currentIndex < greetings.length - 1) {
        currentIndex++;
        _controller.reset();
        _controller.forward();
      } else {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                PlumBookPage(unlockedPlums: unlockedPlums),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Greeting currentGreeting = greetings[currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 211, 211, 211),
                  Color.fromARGB(255, 255, 255, 255)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Learn to greet in ${currentGreeting.language}',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'How do you say "Hello"?',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _buildOptionButton('你好 (nǐ hǎo)', currentGreeting.hello),
                  _buildOptionButton('Hola', currentGreeting.hello),
                  _buildOptionButton('Bonjour', currentGreeting.hello),
                  const SizedBox(height: 40),
                  Text(
                    'How do you say "Thank You"?',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _buildOptionButton('谢谢 (xièxiè)', currentGreeting.thankYou),
                  _buildOptionButton('Gracias', currentGreeting.thankYou),
                  _buildOptionButton('Merci', currentGreeting.thankYou),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String text, String correctAnswer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          if (text == correctAnswer) {
            _onCorrectGreeting();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Oops, try again!')));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.1),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: BorderSide(color: Colors.black.withOpacity(0.6)),
        ),
        child: Text(
          text,
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
