import 'package:coaching_app/features/workout/domain/workout.dart';

import 'user.dart';

/// Encapsulates operations on the list of [User] returned from Firestore.
class UserCollection{
  UserCollection(users) : _users = users;

  final List<User> _users;

  User getUser(String userEmail) {
    return _users.firstWhere((userData) => userData.email == userEmail);
    /*
    return const User(
      id: "user-001",
      name: "Todd Melton",
      email: "jlisoway@hawaii.edu",
      role: "coach",
      workoutIDs: []
    );
     */
  }

  String getRole(User user) {
    return user.role;
  }

  String getUserIDFromEmail(String email) {
    return _users.firstWhere((userData) => userData.email == email).id;
  }

  int size() {
    return _users.length;
  }

  List<String> getWorkoutIDs(String email) {
    return _users.firstWhere((userData) => userData.email == email).workoutIDs;
  }
}
