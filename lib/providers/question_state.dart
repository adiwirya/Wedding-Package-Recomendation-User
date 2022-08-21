import 'package:flutter/material.dart';
import 'criterias.dart';

class QuestionState with ChangeNotifier {
  late Criteria result;
  final PageController controller = PageController();
  var answer = List<dynamic>.filled(13, 3);

  void nextQuestion() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void prevQuestion() async {
    await controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  Future<Criteria> submit() async {
    result = Criteria(
        dekorasi: answer[0],
        bridal: answer[1],
        katering: answer[2],
        dokumentasi: answer[3],
        venue: answer[4],
        entertaiment: answer[5],
        car: answer[6],
        cake: answer[7],
        live: answer[8],
        crew: answer[9],
        tamu: answer[10],
        harga: answer[11]);

    return result;
  }
}
