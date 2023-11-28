import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'individualresponse.freezed.dart';
part 'individualresponse.g.dart';

/// The data associated with individualresponses.
@freezed
class Individualresponse with _$Individualresponse{
  const factory Individualresponse({
    required String id,
    required String name,
    required int Fatigue,
    required int Sleep,
    required int DOMS,
    required int Difficulty,
    required int HR,
  }) = _Individualresponse;
  
  const Individualresponse._();

  factory Individualresponse.fromJson(Map<String, dynamic> json) => _$IndividualresponseFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Individualresponse>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initial_data/individualresponses.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Individualresponse.fromJson(jsonData)).toList();
  }
}