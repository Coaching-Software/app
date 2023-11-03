import 'package:coaching_app/features/workout/data/workout_providers.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user/domain/user.dart';
import 'user/data/user_providers.dart';


part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {required this.users,
        required this.workouts,
      required this.currentUserEmail});

  final List<User> users;
  final List<Workout> workouts;
  final String currentUserEmail;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final users = ref.watch(usersProvider.future);
  final workouts = ref.watch(workoutsProvider.future);
  final currentUserEmail = ref.watch(currentUserEmailProvider);
  return AllData(
      users: await users,
      workouts: await workouts,
      currentUserEmail: currentUserEmail);
}
