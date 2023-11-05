import 'package:coaching_app/features/user/data/user_providers.dart';
import 'package:coaching_app/features/user/domain/user.dart';
import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:coaching_app/features/workout/presentation/workout_history_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../agc_error.dart';
import '../../../../../agc_loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../workout/domain/workouts_collection.dart';

/// Displays basic user info in a bar given a UserID
class CurrentWorkoutBar extends ConsumerWidget {
  const CurrentWorkoutBar({
    super.key,
    required this.workoutID, required Workout workout,
  });

  final String workoutID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          workouts: allData.workouts,
          users: allData.users,
          currentUserEmail: allData.currentUserEmail,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
        required List<Workout> workouts, required List<User> users, required String currentUserEmail}) {
    final workoutCollection = WorkoutCollection(workouts);
    final Workout workout = workoutCollection.getWorkout(workoutID);
    final userCollection = UserCollection(users);
    final currentUser = userCollection.getUser(currentUserEmail);


    return Dismissible(
      key: Key(workoutID),
      onDismissed: (direction) {
        /// TODO: edit user DB (remove workout from user workouts) and workout DB (remove user from workout)
      },
      child: Column(
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
                    builder: (context) => WorkoutItemPage(
                      workoutID: workoutID,
                    )),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 15.0),
                      Text(workout.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const SizedBox(width: 30.0),
                      Text(workout.date,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const SizedBox(width: 30.0),
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
      ),
    );
  }
}
