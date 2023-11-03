import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/workout.dart';
import 'workout_database.dart';

part 'workout_providers.g.dart';

@riverpod
WorkoutDatabase  workoutDatabase(WorkoutDatabaseRef ref) {
  return WorkoutDatabase(ref);
}

@riverpod
Stream<List<Workout>> workouts(WorkoutsRef ref) {
  final database = ref.watch(workoutDatabaseProvider);
  return database.watchWorkouts();
}