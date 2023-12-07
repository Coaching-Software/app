import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:coaching_app/features/workout/presentation/workout_history_bar.dart';
import 'package:coaching_app/features/workout/presentation/workout_history_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../error.dart';
import '../../../../loading.dart';
import '../../all_data_provider.dart';

/// Displays a list of Students in a class.
class WorkoutHistory extends ConsumerWidget {
  const WorkoutHistory({
    super.key,
  });

  static const routeName = '/WorkoutHistory';

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

    List<DateTime> dates = [];
    List<Workout> sortedWorkouts = [];
    DateFormat format = DateFormat("MMM d, yyyy");
    List<String> sortedDates = [];
    for(Workout workout in workouts){
      dates.add(format.parse(workout.date));
    }
    dates.sort((a,b) => b.compareTo(a));
    for(DateTime date in dates){
      sortedDates.add(DateFormat('MMM d, yyyy').format(date));
    }
    for(String date in sortedDates){
      sortedWorkouts.add(workouts.firstWhere((workout) => workout.date == date));
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          ...sortedWorkouts
                              .map((workout) => WorkoutBar(workoutID: workout.id))
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
