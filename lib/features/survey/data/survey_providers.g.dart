// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$surveyDatabaseHash() => r'278d4adabe56095585799534a6ff4ba42be2c180';

/// See also [surveyDatabase].
@ProviderFor(surveyDatabase)
final surveyDatabaseProvider = AutoDisposeProvider<SurveyDatabase>.internal(
  surveyDatabase,
  name: r'surveyDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$surveyDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SurveyDatabaseRef = AutoDisposeProviderRef<SurveyDatabase>;
String _$surveysHash() => r'6931a30153066f859dc1c2d1b095ea45b363a917';

/// See also [surveys].
@ProviderFor(surveys)
final surveysProvider = AutoDisposeStreamProvider<List<Survey>>.internal(
  surveys,
  name: r'surveysProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$surveysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SurveysRef = AutoDisposeStreamProviderRef<List<Survey>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
