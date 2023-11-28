// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individualresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndividualresponseImpl _$$IndividualresponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IndividualresponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      Fatigue: json['Fatigue'] as int,
      Sleep: json['Sleep'] as int,
      DOMS: json['DOMS'] as int,
      Difficulty: json['Difficulty'] as int,
      HR: json['HR'] as int,
    );

Map<String, dynamic> _$$IndividualresponseImplToJson(
        _$IndividualresponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'Fatigue': instance.Fatigue,
      'Sleep': instance.Sleep,
      'DOMS': instance.DOMS,
      'Difficulty': instance.Difficulty,
      'HR': instance.HR,
    };
