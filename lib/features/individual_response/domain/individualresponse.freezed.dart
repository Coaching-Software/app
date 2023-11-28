// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'individualresponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Individualresponse _$IndividualresponseFromJson(Map<String, dynamic> json) {
  return _Individualresponse.fromJson(json);
}

/// @nodoc
mixin _$Individualresponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get Fatigue => throw _privateConstructorUsedError;
  int get Sleep => throw _privateConstructorUsedError;
  int get DOMS => throw _privateConstructorUsedError;
  int get Difficulty => throw _privateConstructorUsedError;
  int get HR => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndividualresponseCopyWith<Individualresponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualresponseCopyWith<$Res> {
  factory $IndividualresponseCopyWith(
          Individualresponse value, $Res Function(Individualresponse) then) =
      _$IndividualresponseCopyWithImpl<$Res, Individualresponse>;
  @useResult
  $Res call(
      {String id,
      String name,
      int Fatigue,
      int Sleep,
      int DOMS,
      int Difficulty,
      int HR});
}

/// @nodoc
class _$IndividualresponseCopyWithImpl<$Res, $Val extends Individualresponse>
    implements $IndividualresponseCopyWith<$Res> {
  _$IndividualresponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? Fatigue = null,
    Object? Sleep = null,
    Object? DOMS = null,
    Object? Difficulty = null,
    Object? HR = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      Fatigue: null == Fatigue
          ? _value.Fatigue
          : Fatigue // ignore: cast_nullable_to_non_nullable
              as int,
      Sleep: null == Sleep
          ? _value.Sleep
          : Sleep // ignore: cast_nullable_to_non_nullable
              as int,
      DOMS: null == DOMS
          ? _value.DOMS
          : DOMS // ignore: cast_nullable_to_non_nullable
              as int,
      Difficulty: null == Difficulty
          ? _value.Difficulty
          : Difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      HR: null == HR
          ? _value.HR
          : HR // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndividualresponseImplCopyWith<$Res>
    implements $IndividualresponseCopyWith<$Res> {
  factory _$$IndividualresponseImplCopyWith(_$IndividualresponseImpl value,
          $Res Function(_$IndividualresponseImpl) then) =
      __$$IndividualresponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int Fatigue,
      int Sleep,
      int DOMS,
      int Difficulty,
      int HR});
}

/// @nodoc
class __$$IndividualresponseImplCopyWithImpl<$Res>
    extends _$IndividualresponseCopyWithImpl<$Res, _$IndividualresponseImpl>
    implements _$$IndividualresponseImplCopyWith<$Res> {
  __$$IndividualresponseImplCopyWithImpl(_$IndividualresponseImpl _value,
      $Res Function(_$IndividualresponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? Fatigue = null,
    Object? Sleep = null,
    Object? DOMS = null,
    Object? Difficulty = null,
    Object? HR = null,
  }) {
    return _then(_$IndividualresponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      Fatigue: null == Fatigue
          ? _value.Fatigue
          : Fatigue // ignore: cast_nullable_to_non_nullable
              as int,
      Sleep: null == Sleep
          ? _value.Sleep
          : Sleep // ignore: cast_nullable_to_non_nullable
              as int,
      DOMS: null == DOMS
          ? _value.DOMS
          : DOMS // ignore: cast_nullable_to_non_nullable
              as int,
      Difficulty: null == Difficulty
          ? _value.Difficulty
          : Difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      HR: null == HR
          ? _value.HR
          : HR // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndividualresponseImpl extends _Individualresponse {
  const _$IndividualresponseImpl(
      {required this.id,
      required this.name,
      required this.Fatigue,
      required this.Sleep,
      required this.DOMS,
      required this.Difficulty,
      required this.HR})
      : super._();

  factory _$IndividualresponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndividualresponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int Fatigue;
  @override
  final int Sleep;
  @override
  final int DOMS;
  @override
  final int Difficulty;
  @override
  final int HR;

  @override
  String toString() {
    return 'Individualresponse(id: $id, name: $name, Fatigue: $Fatigue, Sleep: $Sleep, DOMS: $DOMS, Difficulty: $Difficulty, HR: $HR)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndividualresponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.Fatigue, Fatigue) || other.Fatigue == Fatigue) &&
            (identical(other.Sleep, Sleep) || other.Sleep == Sleep) &&
            (identical(other.DOMS, DOMS) || other.DOMS == DOMS) &&
            (identical(other.Difficulty, Difficulty) ||
                other.Difficulty == Difficulty) &&
            (identical(other.HR, HR) || other.HR == HR));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, Fatigue, Sleep, DOMS, Difficulty, HR);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndividualresponseImplCopyWith<_$IndividualresponseImpl> get copyWith =>
      __$$IndividualresponseImplCopyWithImpl<_$IndividualresponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndividualresponseImplToJson(
      this,
    );
  }
}

abstract class _Individualresponse extends Individualresponse {
  const factory _Individualresponse(
      {required final String id,
      required final String name,
      required final int Fatigue,
      required final int Sleep,
      required final int DOMS,
      required final int Difficulty,
      required final int HR}) = _$IndividualresponseImpl;
  const _Individualresponse._() : super._();

  factory _Individualresponse.fromJson(Map<String, dynamic> json) =
      _$IndividualresponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get Fatigue;
  @override
  int get Sleep;
  @override
  int get DOMS;
  @override
  int get Difficulty;
  @override
  int get HR;
  @override
  @JsonKey(ignore: true)
  _$$IndividualresponseImplCopyWith<_$IndividualresponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
