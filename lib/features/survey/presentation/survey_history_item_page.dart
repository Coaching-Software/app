import 'package:coaching_app/features/individual_response/domain/individualresponse_collection.dart';
import 'package:coaching_app/features/survey/domain/survey.dart';
import 'package:coaching_app/features/survey/domain/survey_collection.dart';
import 'package:coaching_app/features/workout/domain/workouts_collection.dart';
import 'package:coaching_app/features/survey/presentation/ResponseBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../agc_error.dart';
import '../../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../individual_response/domain/individualresponse.dart';

/// Displays a form for creating a group.
class SurveyItemPage extends ConsumerWidget {
  SurveyItemPage({
    super.key,
    required this.surveyID,
  });

  final String surveyID;

  static const routeName = '/viewSurvey';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
              context: context,
              surveys: allData.surveys,
          responses: allData.individualresponses,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required List<Survey> surveys, required List<Individualresponse> responses,
  }) {
    final surveyCollection = SurveyCollection(surveys);
    final responseCollection = IndividualresponseCollection(responses);

    Survey currentSurvey = surveyCollection.getSurvey(surveyID);
    String date = currentSurvey.date;
    int HR = currentSurvey.avgHR;
    int DOMS = currentSurvey.avgDOMS;
    int sleep = currentSurvey.avgSleep;
    int difficulty = currentSurvey.avgDifficulty;
    int fatigue = currentSurvey.avgFatigue;

    List<Individualresponse> individualResponses = [];

    for(var responseID in currentSurvey.individualResponses){
      individualResponses.add(responseCollection.getResponse(responseID));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('$date  Survey Stats',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          // Enter Club Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  height: 250,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Average HR: $HR",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Average Sleep: $sleep",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Average DOMS: $DOMS",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Average Fatigue: $fatigue",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Average Difficulty: $difficulty",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 20.0),
          // Enter Date
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 70,
                width: 375,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...individualResponses
                            .map((response) => ResponseBar(responseID: response.id))
                      ],
                    ),
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
