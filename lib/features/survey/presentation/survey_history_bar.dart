import 'package:coaching_app/features/survey/domain/survey.dart';
import 'package:coaching_app/features/survey/domain/survey_collection.dart';
import 'package:coaching_app/features/survey/presentation/survey_history_item_page.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../all_data_provider.dart';

/// Displays basic user info in a bar given a UserID
class SurveyBar extends ConsumerWidget {
  const SurveyBar({
    super.key,
    required this.surveyID,
  });

  final String surveyID;

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
      {required BuildContext context,
        required List<Survey> surveys}) {

    final surveyCollection = SurveyCollection(surveys);
    Survey currentSurvey = surveyCollection.getSurvey(surveyID);

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: MaterialButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SurveyItemPage(
                    surveyID: surveyID,
                  )),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 15.0),
                    Text(currentSurvey.date,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
