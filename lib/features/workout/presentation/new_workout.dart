
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../data/workout_database.dart';
import '../data/workout_providers.dart';
import '../domain/workouts_collection.dart';

/// Displays a form for creating a group.
class NewWorkout extends ConsumerWidget {
  NewWorkout({
    super.key,
  });

  static const routeName = '/newWorkout';

  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dateFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
              context: context,
              workouts: allData.workouts,
              users: allData.users,
              ref: ref,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({required BuildContext context, required List<
      User> users, required WidgetRef ref, required List<Workout> workouts}) {
    final userCollection = UserCollection(users);
    final workoutCollection = WorkoutCollection(workouts);

    void addWorkoutToAthleteWorkouts(Workout workout){
      userCollection.addWorkout(workout.id, ref);
    }

    void createWorkout() {
      String workoutName = _nameFieldKey.currentState?.value;
      DateTime workoutDate = _dateFieldKey.currentState?.value;
      String workoutDescripton = _descriptionFieldKey.currentState?.value;
      int numWorkouts = workoutCollection.size();
      List<String> athletes = userCollection.getAllAthleteIDs();

      String id = 'workout-${(numWorkouts + 1).toString().padLeft(3, '0')}';


      Workout newWorkout = Workout(
        id: id,
        name: workoutName,
        date: DateFormat('MMM dd, yyyy').format(workoutDate),
        description: workoutDescripton,
        athletes: athletes,
      );
      addWorkoutToAthleteWorkouts(newWorkout);
      WorkoutDatabase workoutDatabase = ref.watch(workoutDatabaseProvider);
      workoutDatabase.setWorkout(newWorkout);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white), "New Workout"),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
      body: Column(
        children: [
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  // Enter Club Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 375,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: FormBuilderTextField(
                          style: const TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          key: _nameFieldKey,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.0)),
                            ),
                            filled: true,
                            fillColor: Theme
                                .of(context)
                                .primaryColor,
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                            hintText: 'Enter Name',
                          ),
                          name: 'name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  // Enter Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 50,
                        width: 375,
                        child: FormBuilderDateTimePicker(
                          inputType: InputType.date,
                          format: DateFormat('MMM d, yyyy'),
                          enabled: true,
                          key: _dateFieldKey,
                          maxLines: 3,
                          minLines: 2,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 0, 0, 0.0)),
                            ),
                            filled: true,
                            fillColor: Theme
                                .of(context)
                                .primaryColor,
                            hintStyle: TextStyle(color: Colors.grey[400],
                                fontSize: 20),
                            hintText: 'Select Date',
                          ),
                          name: 'date',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Enter Workout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 400,
                        width: 375,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .primaryColorLight,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: FormBuilderTextField(
                          key: _descriptionFieldKey,
                          maxLines: 20,
                          minLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme
                                .of(context)
                                .primaryColorLight,
                            hintStyle: TextStyle(
                                color: Colors.grey[700], fontSize: 20),
                            hintText: 'Enter Workout',
                          ),
                          name: 'workout',
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(height: 30,),
          // Create Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 45,
                width: 375,
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    createWorkout();
                  },
                  child: const Text('Create',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}