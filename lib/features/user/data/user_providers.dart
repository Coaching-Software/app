import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/user.dart';
import 'user_database.dart';

part 'user_providers.g.dart';

@riverpod
UserDatabase userDatabase(UserDatabaseRef ref) {
  return UserDatabase(ref);
}

@riverpod
String currentUserEmail(CurrentUserEmailRef ref) {
  /*
  AuthStateChangeAction<SignedIn>((context, state) {
    email = state.user!.email!;
  });
   */

  FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  print("Still using this!");
  return instance.currentUser!.email!;
}

@riverpod
Stream<List<User>> users(UsersRef ref) {
  final database = ref.watch(userDatabaseProvider);
  return database.watchUsers();
}

@riverpod
Future<User> currentUser(CurrentUserRef ref) async {
  final String currentUserId = ref.watch(currentUserEmailProvider);
  final database = ref.watch(userDatabaseProvider);
  return await database.fetchUser(currentUserId);
}