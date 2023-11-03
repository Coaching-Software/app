import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/workout.dart';

/// Provides access to the Firestore database storing [Workout] documents.
class WorkoutDatabase {
  WorkoutDatabase(this.ref);

  final ProviderRef<WorkoutDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Workout>> watchWorkouts() => _service.watchCollection(
      path: FirestorePath.workouts(),
      builder: (data, documentId) => Workout.fromJson(data!));

  Stream<Workout> watchWorkout(String workoutId) => _service.watchDocument(
      path: FirestorePath.workout(workoutId),
      builder: (data, documentId) => Workout.fromJson(data!));

  Future<List<Workout>> fetchWorkouts() => _service.fetchCollection(
      path: FirestorePath.workouts(),
      builder: (data, documentId) => Workout.fromJson(data!));

  Future<Workout> fetchWorkout(String workoutId) => _service.fetchDocument(
      path: FirestorePath.workout(workoutId),
      builder: (data, documentId) => Workout.fromJson(data!));

  Future<void> setWorkout(Workout workout) => _service.setData(
      path: FirestorePath.workout(workout.id), data: workout.toJson());

  Future<void> deleteWorkout(Workout workout) =>
      _service.deleteData(path: FirestorePath.workout(workout.id));
}
