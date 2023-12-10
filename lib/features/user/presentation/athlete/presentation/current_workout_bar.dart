import 'package:coaching_app/features/user/data/user_providers.dart';
import 'package:coaching_app/features/user/domain/user.dart';
import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:coaching_app/features/workout/presentation/workout_history_item_page.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../workout/domain/edit_workout_controller.dart';
import '../../../domain/edit_user_controller.dart';


import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../global_snackbar.dart';
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
          ref: ref,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
        required List<Workout> workouts, required List<User> users, required WidgetRef ref}) {
    final workoutCollection = WorkoutCollection(workouts);
    final Workout workout = workoutCollection.getWorkout(workoutID);
    final userCollection = UserCollection(users);
    final currentAuthUser = FirebaseAuth.instance.currentUser;
    String? currentUserEmail = currentAuthUser?.email;
    final currentUser = userCollection.getUser(currentUserEmail!);

    return Dismissible(
      key: Key(workoutID),
      onDismissed: (direction) {
         List<String> updatedWorkoutIDs = [];
          for (var aWorkoutID in currentUser.workoutIDs!){
            if(aWorkoutID != workoutID){
              updatedWorkoutIDs.add(aWorkoutID);
            }
          }
          User updatedUser = User(
            id: currentUser.id,
            name: currentUser.name,
            role: currentUser.role,
            email: currentUser.email,
            workoutIDs: updatedWorkoutIDs,
            surveySubmitted: currentUser.surveySubmitted,
          );

          List<String> newAthletes = [];

         for (var athleteID in workout.athletes!){
           if(athleteID != currentUser.id){
             newAthletes.add(athleteID);
           }
         }
         Workout updatedWorkout = Workout(
           id: workout.id,
           name: workout.name,
           description: workout.description,
           athletes: newAthletes,
           date: workout.date,
         );

         ref.read(editWorkoutControllerProvider.notifier).updateWorkout(
           workout: updatedWorkout,
           onSuccess: () {
           },
         );

          ref.read(editUserControllerProvider.notifier).updateUser(
            user: updatedUser,
            onSuccess: () {
              GlobalSnackBar.show('Deleted Workout!', context);
            },
          );
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
                      const SizedBox(width: 5.0),
                      Text(workout.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const SizedBox(width: 10.0),
                      Text(workout.date,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      const SizedBox(width: 5.0),
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
