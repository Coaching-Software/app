// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
mixin _$Survey {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get avgFatigue => throw _privateConstructorUsedError;
  int get avgSleep => throw _privateConstructorUsedError;
  int get avgDOMS => throw _privateConstructorUsedError;
  int get avgDifficulty => throw _privateConstructorUsedError;
  int get avgHR => throw _privateConstructorUsedError;
  List<String> get individualResponses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res, Survey>;
  @useResult
  $Res call(
      {String id,
      String date,
      int avgFatigue,
      int avgSleep,
      int avgDOMS,
      int avgDifficulty,
      int avgHR,
      List<String> individualResponses});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res, $Val extends Survey>
    implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? avgFatigue = null,
    Object? avgSleep = null,
    Object? avgDOMS = null,
    Object? avgDifficulty = null,
    Object? avgHR = null,
    Object? individualResponses = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      avgFatigue: null == avgFatigue
          ? _value.avgFatigue
          : avgFatigue // ignore: cast_nullable_to_non_nullable
              as int,
      avgSleep: null == avgSleep
          ? _value.avgSleep
          : avgSleep // ignore: cast_nullable_to_non_nullable
              as int,
      avgDOMS: null == avgDOMS
          ? _value.avgDOMS
          : avgDOMS // ignore: cast_nullable_to_non_nullable
              as int,
      avgDifficulty: null == avgDifficulty
          ? _value.avgDifficulty
          : avgDifficulty // ignore: cast_nullable_to_non_nullable
              as int,
      avgHR: null == avgHR
          ? _value.avgHR
          : avgHR // ignore: cast_nullable_to_non_nullable
              as int,
      individualResponses: null == individualResponses
          ? _value.individualResponses
          : individualResponses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyImplCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$$SurveyImplCopyWith(
          _$SurveyImpl value, $Res Function(_$SurveyImpl) then) =
      __$$SurveyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String date,
      int avgFatigue,
      int avgSleep,
      int avgDOMS,
      int avgDifficulty,
      int avgHR,
      List<String> individualResponses});
}

/// @nodoc
class __$$SurveyImplCopyWithImpl<$Res>
    extends _$SurveyCopyWithImpl<$Res, _$SurveyImpl>
    implements _$$SurveyImplCopyWith<$Res> {
  __$$SurveyImplCopyWithImpl(
      _$SurveyImpl _value, $Res Function(_$SurveyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? avgFatigue = null,
    Object? avgSleep = null,
    Object? avgDOMS = null,
    Object? avgDifficulty = null,
    Object? avgHR = null,
    Object? individualResponses = null,
  }) {
    return _then(_$SurveyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      avgFatigue: null == avgFatigue
          ? _value.avgFatigue
          : avgFatigue // ignore: cast_nullable_to_non_nullable
              as int,
      avgSleep: null == avgSleep
          ? _value.avgSleep
          : avgSleep // ignore: cast_nullable_to_non_nullable
              as int,
      avgDOMS: null == avgDOMS
          ? _value.avgDOMS
          : avgDOMS // ignore: cast_nullable_to_non_nullable
              as int,
      avgDifficulty: null == avgDifficulty
          ? _value.avgDifficulty
          : avgDifficulty // ignore: cast_nullable_to_non_nullable
              as int,
      avgHR: null == avgHR
          ? _value.avgHR
          : avgHR // ignore: cast_nullable_to_non_nullable
              as int,
      individualResponses: null == individualResponses
          ? _value._individualResponses
          : individualResponses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyImpl extends _Survey {
  const _$SurveyImpl(
      {required this.id,
      required this.date,
      required this.avgFatigue,
      required this.avgSleep,
      required this.avgDOMS,
      required this.avgDifficulty,
      required this.avgHR,
      required final List<String> individualResponses})
      : _individualResponses = individualResponses,
        super._();

  factory _$SurveyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyImplFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  final int avgFatigue;
  @override
  final int avgSleep;
  @override
  final int avgDOMS;
  @override
  final int avgDifficulty;
  @override
  final int avgHR;
  final List<String> _individualResponses;
  @override
  List<String> get individualResponses {
    if (_individualResponses is EqualUnmodifiableListView)
      return _individualResponses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_individualResponses);
  }

  @override
  String toString() {
    return 'Survey(id: $id, date: $date, avgFatigue: $avgFatigue, avgSleep: $avgSleep, avgDOMS: $avgDOMS, avgDifficulty: $avgDifficulty, avgHR: $avgHR, individualResponses: $individualResponses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.avgFatigue, avgFatigue) ||
                other.avgFatigue == avgFatigue) &&
            (identical(other.avgSleep, avgSleep) ||
                other.avgSleep == avgSleep) &&
            (identical(other.avgDOMS, avgDOMS) || other.avgDOMS == avgDOMS) &&
            (identical(other.avgDifficulty, avgDifficulty) ||
                other.avgDifficulty == avgDifficulty) &&
            (identical(other.avgHR, avgHR) || other.avgHR == avgHR) &&
            const DeepCollectionEquality()
                .equals(other._individualResponses, _individualResponses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      avgFatigue,
      avgSleep,
      avgDOMS,
      avgDifficulty,
      avgHR,
      const DeepCollectionEquality().hash(_individualResponses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyImplCopyWith<_$SurveyImpl> get copyWith =>
      __$$SurveyImplCopyWithImpl<_$SurveyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyImplToJson(
      this,
    );
  }
}

abstract class _Survey extends Survey {
  const factory _Survey(
      {required final String id,
      required final String date,
      required final int avgFatigue,
      required final int avgSleep,
      required final int avgDOMS,
      required final int avgDifficulty,
      required final int avgHR,
      required final List<String> individualResponses}) = _$SurveyImpl;
  const _Survey._() : super._();

  factory _Survey.fromJson(Map<String, dynamic> json) = _$SurveyImpl.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  int get avgFatigue;
  @override
  int get avgSleep;
  @override
  int get avgDOMS;
  @override
  int get avgDifficulty;
  @override
  int get avgHR;
  @override
  List<String> get individualResponses;
  @override
  @JsonKey(ignore: true)
  _$$SurveyImplCopyWith<_$SurveyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
