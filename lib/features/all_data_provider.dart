import 'package:coaching_app/features/individual_response/domain/individualresponse.dart';
import 'package:coaching_app/features/survey/data/survey_providers.dart';
import 'package:coaching_app/features/survey/domain/survey.dart';
import 'package:coaching_app/features/workout/data/workout_providers.dart';
import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'individual_response/data/individualresponse_providers.dart';
import 'user/domain/user.dart';
import 'user/data/user_providers.dart';


part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {required this.users,
        required this.workouts,
        required this.surveys,
        required this.individualresponses});

  final List<User> users;
  final List<Workout> workouts;
  final List<Survey> surveys;
  final List<Individualresponse> individualresponses;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final users = ref.watch(usersProvider.future);
  final workouts = ref.watch(workoutsProvider.future);
  final surveys = ref.watch(surveysProvider.future);
  final individualresponses = ref.watch(individualresponsesProvider.future);
  return AllData(
      users: await users,
      workouts: await workouts,
      surveys: await surveys,
      individualresponses: await individualresponses,
  );
}
