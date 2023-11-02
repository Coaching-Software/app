import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user/domain/user.dart';
import 'user/data/user_providers.dart';


part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {required this.users,
      required this.currentUserEmail});

  final List<User> users;
  final String currentUserEmail;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final users = ref.watch(usersProvider.future);
  final currentUserEmail = ref.watch(currentUserEmailProvider);
  return AllData(
      users: await users,
      currentUserEmail: currentUserEmail);
}
