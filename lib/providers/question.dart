import 'package:flutter/cupertino.dart';

class Question with ChangeNotifier {
  String questionText;
  List<Option> options;

  Question({required this.questionText, required this.options});
}

class Option with ChangeNotifier{
  String optionText;
  int value;
  bool isSelected;

  Option(
      {required this.optionText, required this.value, this.isSelected = false});

  void selected() {
    isSelected = !isSelected;
    notifyListeners();
  }
}

class Questions with ChangeNotifier {
  List<Question> _question = [
    Question(
        questionText:
            'Seberapa Penting Dekorasi Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Bridal Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Katering Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Dokumentasi Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Venue Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Hiburan Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Mobil Pengantin Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Kue Pernikahan Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Layanan LiveStreaming Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Jumlah Crew Wedding Organizer Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText:
            'Seberapa Penting Jumlah Tamu Pada Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
    Question(
        questionText: 'Seberapa Penting Harga Paket Pernikahan Menurut Anda ?',
        options: [
          Option(optionText: 'Sangat Penting', value: 5),
          Option(optionText: 'Penting', value: 4),
          Option(optionText: 'Netral', value: 3),
          Option(optionText: 'Mungkin Penting', value: 2),
          Option(optionText: 'Tidak Penting', value: 1),
          Option(optionText: 'Tidak Perlu', value: 0),
        ]),
  ];

  List<Question> get questions {
    return [..._question];
  }
}
