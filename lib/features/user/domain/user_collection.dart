import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/edit_user_controller.dart';
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

  List<String> getAllAthleteIDs() {
    List<String> ids = [];
    for(User user in _users){
      if(user.role == "athlete"){
        ids.add(user.id);
      }
    }
    return ids;
  }

  bool hasSubmittedSurvey(String userEmail) {
    return getUser(userEmail).surveySubmitted;
  }

  void sendNewSurvey( WidgetRef ref){
    for(User user in _users){
      User updatedUser = User(
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role,
        workoutIDs: user.workoutIDs,
        surveySubmitted: false,
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
        user: updatedUser,
        onSuccess: () {
        },
      );
    }
  }

  void addWorkout(String workoutID, WidgetRef ref) {
    for(User user in _users){
      if(user.role == "athlete"){
        List<String> newWorkoutIDs = [];
        if (user.workoutIDs!= Null){
          for (var workoutID in user.workoutIDs!){
            newWorkoutIDs.add(workoutID);
          }
        }
        newWorkoutIDs.add(workoutID);
        User updatedUser = User(
          id: user.id,
          name: user.name,
          email: user.email,
          role: user.role,
          workoutIDs: newWorkoutIDs,
          surveySubmitted: user.surveySubmitted,
        );
        ref.read(editUserControllerProvider.notifier).updateUser(
          user: updatedUser,
          onSuccess: () {
          },
        );
      }
    }
  }
}
