import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:coaching_app/features/workout/presentation/workout_history_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../error.dart';
import '../../../../loading.dart';
import '../../all_data_provider.dart';
import '../../survey/presentation/survey_history_item_page.dart';
import '../domain/workouts_collection.dart';

/// Displays basic user info in a bar given a UserID
class WorkoutBar extends ConsumerWidget {
  const WorkoutBar({
    super.key,
    required this.workoutID,
  });

  final String workoutID;

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
    final workoutCollection = WorkoutCollection(workouts);
    final Workout workout = workoutCollection.getWorkout(workoutID);

    return Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorkoutItemPage(
                        workoutID: workoutID,
                      ),
                  ),
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(workout.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(workout.date,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],

    );
  }
}
