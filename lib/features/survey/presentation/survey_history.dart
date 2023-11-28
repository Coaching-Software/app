import 'package:coaching_app/features/survey/domain/survey_collection.dart';
import 'package:coaching_app/features/survey/presentation/survey_history_bar.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../agc_error.dart';
import '../../../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../domain/survey.dart';

/// Displays a list of Students in a class.
class SurveyHistory extends ConsumerWidget {
  const SurveyHistory({
    super.key,
  });

  static const routeName = '/SurveyHistory';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          surveys: allData.surveys,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context, required List<Survey> surveys}) {

    List<DateTime> dates = [];
    List<Survey> sortedSurveys = [];
    DateFormat format = DateFormat("MMM dd, yyyy");
    List<String> sortedDates = [];
    for(Survey survey in surveys){
      dates.add(format.parse(survey.date));
    }
    dates.sort((a,b) => b.compareTo(a));
    for(DateTime date in dates){
      sortedDates.add(DateFormat('MMM d, yyyy').format(date));
    }
    for(String date in sortedDates){
      sortedSurveys.add(surveys.firstWhere((survey) => survey.date == date));
    }

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...sortedSurveys
                          .map((survey) => SurveyBar(surveyID: survey.id))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
