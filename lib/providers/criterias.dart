import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Criteria with ChangeNotifier {
  int dekorasi;
  int bridal;
  int catering;
  int dokumentasi;
  int venue;
  int entertaiment;
  int tamu;
  int harga;
  int car;
  int cake;
  int crew;
  int live;

  Criteria({
    required this.dekorasi,
    required this.bridal,
    required this.catering,
    required this.dokumentasi,
    required this.venue,
    required this.entertaiment,
    required this.tamu,
    required this.harga,
    required this.car,
    required this.cake,
    required this.crew,
    required this.live,
  });
}

class Result with ChangeNotifier {
  String id;
  String nama;
  String image;
  int harga;
  double nilai;

  Result({
    required this.id,
    required this.nama,
    required this.image,
    required this.harga,
    required this.nilai,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      nama: json['nama'],
      image: json['image'],
      harga: json['harga'],
      nilai: json['total'],
    );
  }
}

class Results with ChangeNotifier {
  List<Result> _results = [];

  List<Result> get results {
    return [..._results];
  }

  Future<void> getRecomendation(Criteria criteria) async {
    final url = Uri.https('skripsi-spk-saw.herokuapp.com', '/api/paket/rec/');

    // try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({
            "dekorasi": criteria.dekorasi,
            "bridal": criteria.bridal,
            "catering": criteria.catering,
            "dokumentasi": criteria.dokumentasi,
            "venue": criteria.venue,
            "entertaiment": criteria.entertaiment,
            "jumlahTamu": criteria.tamu,
            "totalHarga": criteria.harga,
            "car": criteria.car,
            "cake": criteria.cake,
            "crew": criteria.crew,
            "live": criteria.live
          }));
      final jsonObj = json.decode(response.body);

      final List<Result> loadedResults = [];
      for (int i = 0; i < jsonObj.length; i++) {
        loadedResults.add(Result.fromJson(jsonObj[i]));
      }
      _results = loadedResults;
      notifyListeners();
    // } catch (e) {
    //   rethrow;
    // }
  }
}
