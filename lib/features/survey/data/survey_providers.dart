import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/survey.dart';
import '../domain/survey_collection.dart';
import 'survey_database.dart';

part 'survey_providers.g.dart';

@riverpod
SurveyDatabase surveyDatabase(SurveyDatabaseRef ref) {
  return SurveyDatabase(ref);
}

@riverpod
Stream<List<Survey>> surveys(SurveysRef ref) {
  final database = ref.watch(surveyDatabaseProvider);
  return database.watchSurveys();
}