import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'survey.dart';

/// Encapsulates operations on the list of [Survey] returned from Firestore.
class SurveyCollection{
  SurveyCollection(surveys) : _surveys = surveys;

  final List<Survey> _surveys;

  int size() {
    return _surveys.length;
  }

  Survey getLatestSurvey(){
    return _surveys.last;
  }

  Survey getSurvey(String surveyID) {
    return _surveys.firstWhere((data) => data.id == surveyID);
  }
}
