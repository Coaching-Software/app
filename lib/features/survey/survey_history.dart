import 'package:coaching_app/features/survey/survey_history_bar.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../agc_error.dart';
import '../../../../agc_loading.dart';
import '../all_data_provider.dart';

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
          workouts: allData.workouts,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context, required List<Workout> workouts}) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 20.0),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ...workouts
                            .map((workout) => SurveyBar(surveyID: workout.id))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
