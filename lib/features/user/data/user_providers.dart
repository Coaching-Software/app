import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/user.dart';
import '../domain/user_collection.dart';
import 'user_database.dart';

part 'user_providers.g.dart';

@riverpod
UserDatabase userDatabase(UserDatabaseRef ref) {
  return UserDatabase(ref);
}

/*
final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

 */

@riverpod
String currentUserEmail(CurrentUserEmailRef ref) {
  //final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  //Future<List<User>> userList = users().first;
  //users.
  //users.firstWhere((userData) => userData.email == instance.currentUser!.email!).id;
  //final userCollection = UserCollection(users);
  //return userCollection.getUserIDFromEmail(instance.currentUser!.email!);


  final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  print(instance.currentUser?.email! ?? 'nothing');
  return instance.currentUser?.email! ?? '';



  return "user-001";
}

/*
final currentUserIDProvider = StateProvider<String>((ref) {
  return 'user-001';
});

 */

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