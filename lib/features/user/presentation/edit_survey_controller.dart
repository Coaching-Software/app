import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../survey/data/survey_database.dart';
import '../../survey/data/survey_providers.dart';
import '../../survey/domain/survey.dart';


part 'edit_survey_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditSurveyController extends _$EditSurveyController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  Future<void> updateSurvey({
    required Survey survey,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    SurveyDatabase surveyDatabase = ref.watch(surveyDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => surveyDatabase.setSurvey(survey));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteSurvey({
    required Survey survey,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    SurveyDatabase surveyDatabase = ref.watch(surveyDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => surveyDatabase.deleteSurvey(survey));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
