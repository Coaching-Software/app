import 'workout.dart';

class WorkoutCollection {
  WorkoutCollection(workouts) : _workouts = workouts;

  final List<Workout> _workouts;

  Workout getWorkout(String workoutID) {
    return _workouts.firstWhere((data) => data.id == workoutID);
  }

  List<Workout> getWorkouts(List<String> workoutIDs) {
    List<Workout> workouts = [];
    for (var workoutID in workoutIDs){
      workouts.add(getWorkout(workoutID));
    }
    return workouts;
  }

  int size() {
    return _workouts.length;
  }
}