import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/survey.dart';

// Provides access to the Firestore database storing Survey documents.
class SurveyDatabase {
  SurveyDatabase(this.ref);

  final ProviderRef<SurveyDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Survey>> watchSurveys() => _service.watchCollection(
      path: FirestorePath.surveys(),
      builder: (data, documentId) => Survey.fromJson(data!));

  Stream<Survey> watchSurvey(String surveyId) => _service.watchDocument(
      path: FirestorePath.survey(surveyId),
      builder: (data, documentId) => Survey.fromJson(data!));

  Future<List<Survey>> fetchSurveys() => _service.fetchCollection(
      path: FirestorePath.surveys(),
      builder: (data, documentId) => Survey.fromJson(data!));

  Future<Survey> fetchSurvey(String surveyId) => _service.fetchDocument(
      path: FirestorePath.survey(surveyId),
      builder: (data, documentId) => Survey.fromJson(data!));

  Future<void> setSurvey(Survey survey) =>
      _service.setData(path: FirestorePath.survey(survey.id), data: survey.toJson());

  deleteSurvey(Survey survey) {}

}
