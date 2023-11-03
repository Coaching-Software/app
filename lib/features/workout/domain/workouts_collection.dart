import 'workout.dart';

class WorkoutCollection {
  WorkoutCollection(workouts) : _workouts = workouts;

  final List<Workout> _workouts;

  Workout getWorkout(String workoutID) {
    return _workouts.firstWhere((data) => data.id == workoutID);
  }
}