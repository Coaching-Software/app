import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

/// The data associated with workouts.
@freezed
class Workout with _$Workout{
  const factory Workout({
    required String id,
    required String name,
    required String description,
    required List<String> athletes,
    required String date,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Workout>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initial_data/workouts.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Workout.fromJson(jsonData)).toList();
  }
}
