import '../domain/greeting.dart';
import '../../plums/domain/plum.dart';

class GreetingDataSource {
  List<Greeting> getGreetings() {
    return [
      Greeting(
          language: "Mandarin", hello: "你好 (nǐ hǎo)", thankYou: "谢谢 (xièxiè)"),
      Greeting(language: "Spanish", hello: "Hola", thankYou: "Gracias"),
      Greeting(language: "French", hello: "Bonjour", thankYou: "Merci"),
    ];
  }

  List<Plum> getPlums() {
    return [
      Plum(
        language: "Mandarin",
        culturalItem: "Chinese Lantern",
        description:
            "A beautiful red lantern, symbolizing happiness and good fortune in Chinese culture.",
      ),
      Plum(
        language: "Spanish",
        culturalItem: "Spanish Fan",
        description:
            "A traditional fan often used in dances like Flamenco, representing elegance and grace.",
      ),
      Plum(
        language: "French",
        culturalItem: "French Baguette",
        description:
            "A crispy, long loaf of bread, a staple of French cuisine and a symbol of everyday French life.",
      ),
    ];
  }
}
