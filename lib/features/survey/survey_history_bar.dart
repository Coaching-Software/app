import 'package:coaching_app/features/survey/survey_history_item_page.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../agc_error.dart';
import '../../../../agc_loading.dart';
import '../all_data_provider.dart';

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
          workouts: allData.workouts,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
        required List<Workout> workouts}) {

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 375,
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15.0),
                    Text("Survey date",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    SizedBox(width: 30.0),
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