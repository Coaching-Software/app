import 'package:coaching_app/features/user/domain/user.dart';
import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../workout/domain/workout.dart';
import '../../../../workout/domain/workouts_collection.dart';
import 'current_workout_bar.dart';


/// Displays a page listing all workouts belonging to an Athlete
class CurrentWorkoutsView extends ConsumerWidget {
  CurrentWorkoutsView({
    super.key,
  });

  static const routeName = '/currentWorkoutsView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          workouts: allData.workouts,
          users: allData.users,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context, required List<Workout> workouts, required List<User> users}) {
    final workoutCollection = WorkoutCollection(workouts);
    final userCollection = UserCollection(users);
    final currentUser = FirebaseAuth.instance.currentUser;
    String? currentUserEmail = currentUser?.email;
    List<String> currentUserWorkoutIDs = userCollection.getWorkoutIDs(currentUserEmail!);
    List<Workout> currentUserWorkouts = workoutCollection.getWorkouts(currentUserWorkoutIDs);

    List<DateTime> dates = [];
    List<Workout> sortedWorkouts = [];
    DateFormat format = DateFormat("MMM d, yyyy");
    List<String> sortedDates = [];
    for(Workout workout in currentUserWorkouts){
      dates.add(format.parse(workout.date));
    }
    dates.sort((a,b) => b.compareTo(a));
    for(DateTime date in dates){
      sortedDates.add(DateFormat('MMM d, yyyy').format(date));
    }
    for(String date in sortedDates){
      sortedWorkouts.add(workouts.firstWhere((workout) => workout.date == date));
    }

    print("current user Email from current workouts view:");
    print(currentUserEmail);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Current Workouts"),
            ],
          ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                children: [
                  ...sortedWorkouts
                      .map((workout) => CurrentWorkoutBar(workout: workout, workoutID: workout.id))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}