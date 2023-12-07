import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/workout_providers.dart';
import '../data/workout_database.dart';
import 'workout.dart';

part 'edit_workout_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditWorkoutController extends _$EditWorkoutController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  Future<void> updateWorkout({
    required Workout workout,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    WorkoutDatabase workoutDatabase = ref.watch(workoutDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => workoutDatabase.setWorkout(workout));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteWorkout({
    required Workout workout,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    WorkoutDatabase workoutDatabase = ref.watch(workoutDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => workoutDatabase.deleteWorkout(workout));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
