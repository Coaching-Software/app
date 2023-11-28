/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String user(String userID) => 'users/$userID';
  static String users() => 'users';

  static String workout(String workoutID) => 'workouts/$workoutID';
  static String workouts() => 'workouts';

  static String survey(String surveyID) => 'surveys/$surveyID';
  static String surveys() => 'surveys';

  static String individualresponse(String individualresponseID) => 'individualresponses/$individualresponseID';
  static String individualresponses() => 'individualresponses';
}
