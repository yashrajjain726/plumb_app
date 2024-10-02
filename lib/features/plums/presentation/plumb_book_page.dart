import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plum_app/features/plums/domain/plum.dart';

class PlumBookPage extends StatelessWidget {
  final List<Plum> unlockedPlums;

  const PlumBookPage({super.key, required this.unlockedPlums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plum Book',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Magic Plums Collected:',
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: unlockedPlums.length,
                  itemBuilder: (context, index) {
                    final plum = unlockedPlums[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ScaleTransition(
                        scale: const AlwaysStoppedAnimation(1.1),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            title: Text(
                              '${plum.language} Plum',
                              style: GoogleFonts.comfortaa(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              plum.culturalItem,
                              style: GoogleFonts.comfortaa(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
