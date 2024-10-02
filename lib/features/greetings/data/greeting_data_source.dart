import 'package:plum_app/features/plums/domain/plum.dart';
import '../domain/greeting.dart';

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
      Plum(language: "Mandarin", culturalItem: "Chinese Lantern"),
      Plum(language: "Spanish", culturalItem: "Spanish Fan"),
      Plum(language: "French", culturalItem: "French Baguette"),
    ];
  }
}
