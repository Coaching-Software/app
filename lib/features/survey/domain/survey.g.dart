// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyImpl _$$SurveyImplFromJson(Map<String, dynamic> json) => _$SurveyImpl(
      id: json['id'] as String,
      date: json['date'] as String,
      avgFatigue: json['avgFatigue'] as int,
      avgSleep: json['avgSleep'] as int,
      avgDOMS: json['avgDOMS'] as int,
      avgDifficulty: json['avgDifficulty'] as int,
      avgHR: json['avgHR'] as int,
      individualResponses: (json['individualResponses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SurveyImplToJson(_$SurveyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'avgFatigue': instance.avgFatigue,
      'avgSleep': instance.avgSleep,
      'avgDOMS': instance.avgDOMS,
      'avgDifficulty': instance.avgDifficulty,
      'avgHR': instance.avgHR,
      'individualResponses': instance.individualResponses,
    };
