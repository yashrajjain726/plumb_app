import 'package:flutter/material.dart';
import 'package:plum_app/features/plums/presentation/plumb_book_page.dart';
import '../../data/greeting_data_source.dart';
import '../../domain/greeting.dart';
import '../../../plums/domain/plum.dart';

class GreetingsPage extends StatefulWidget {
  const GreetingsPage({super.key});

  @override
  _GreetingsPageState createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage> {
  final GreetingDataSource _greetingDataSource = GreetingDataSource();
  List<Greeting> greetings = [];
  List<Plum> plums = [];
  int currentIndex = 0;
  List<Plum> unlockedPlums = [];

  @override
  void initState() {
    super.initState();
    greetings = _greetingDataSource.getGreetings();
    plums = _greetingDataSource.getPlums();
  }

  void _onCorrectGreeting() {
    setState(() {
      unlockedPlums.add(plums[currentIndex]);
      if (currentIndex < greetings.length - 1) {
        currentIndex++;
      } else {
        // Navigate to the PlumBookPage when all plums are unlocked
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlumBookPage(unlockedPlums: unlockedPlums)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Greeting currentGreeting = greetings[currentIndex];
    Plum currentPlum = plums[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('The Magic Plum Tree Awakes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Meet someone from ${currentGreeting.language}!',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
                'assets/images/${currentPlum.culturalItem.toLowerCase().replaceAll(" ", "-")}.png',
                height: 100),
            const SizedBox(height: 20),
            _buildOptions(currentGreeting),
          ],
        ),
      ),
    );
  }

  Widget _buildOptions(Greeting greeting) {
    return Column(
      children: [
        Text('Which one is "${greeting.hello}"?'),
        _buildGreetingButton('你好 (nǐ hǎo)', greeting.hello),
        _buildGreetingButton('Hola', greeting.hello),
        _buildGreetingButton('Bonjour', greeting.hello),
        const SizedBox(height: 20),
        Text('Which one is "${greeting.thankYou}"?'),
        _buildGreetingButton('谢谢 (xièxiè)', greeting.thankYou),
        _buildGreetingButton('Gracias', greeting.thankYou),
        _buildGreetingButton('Merci', greeting.thankYou),
      ],
    );
  }

  Widget _buildGreetingButton(String text, String correctAnswer) {
    return ElevatedButton(
      onPressed: () {
        if (text == correctAnswer) {
          _onCorrectGreeting();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Try again!')));
        }
      },
      child: Text(text),
    );
  }
}
