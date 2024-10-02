import 'package:flutter/material.dart';
import '../../plums/domain/plum.dart';

class PlumBookPage extends StatelessWidget {
  final List<Plum> unlockedPlums;

  const PlumBookPage({super.key, required this.unlockedPlums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plum Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Magic Plums Collected:',
                style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: unlockedPlums.length,
                itemBuilder: (context, index) {
                  final plum = unlockedPlums[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${plum.language} Plum',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cultural Item: ${plum.culturalItem}',
                              style: const TextStyle(fontSize: 16)),
                          Text(plum.description,
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
