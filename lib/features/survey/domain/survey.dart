import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

/// The data associated with surveys.
@freezed
class Survey with _$Survey{
  const factory Survey({
    required String id,
    required String date,
    required int avgFatigue,
    required int avgSleep,
    required int avgDOMS,
    required int avgDifficulty,
    required int avgHR,
    required List<String> individualResponses,
  }) = _Survey;

  const Survey._();

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}