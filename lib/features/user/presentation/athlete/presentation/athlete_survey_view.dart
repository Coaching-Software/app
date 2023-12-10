import 'package:coaching_app/features/individual_response/domain/individualresponse_collection.dart';
import 'package:coaching_app/features/survey/domain/survey.dart';
import 'package:coaching_app/features/survey/domain/survey_collection.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../individual_response/data/individualresponse_database.dart';
import '../../../../individual_response/data/individualresponse_providers.dart';
import '../../../../individual_response/domain/individualresponse.dart';
import '../../../../survey/data/survey_database.dart';
import '../../../../survey/data/survey_providers.dart';
import '../../../../workout/domain/workout.dart';
import '../../../domain/user.dart';
import '../../../domain/user_collection.dart';
import '../../../../survey/domain/edit_survey_controller.dart';
import '../../../domain/edit_user_controller.dart';

/// Middle-level Layout for the profile view, shows either classes or groups for currently signin user
class AthleteSurveyView extends ConsumerWidget {
  AthleteSurveyView({
    super.key,
  });

  static const routeName = '/athleteSurveyView';
  final _formKey = GlobalKey<FormBuilderState>();
  final _fatigueFormKey = GlobalKey<FormBuilderFieldState>();
  final _sleepFormKey = GlobalKey<FormBuilderFieldState>();
  final _DOMSFormKey = GlobalKey<FormBuilderFieldState>();
  final _difficultyFormKey = GlobalKey<FormBuilderFieldState>();
  final _HRFormKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
              context: context,
              workouts: allData.workouts,
              users: allData.users,
              individualresponses: allData.individualresponses,
              surveys: allData.surveys,
              ref: ref,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({required BuildContext context,
    required List<User> users,
    required WidgetRef ref,
    required List<Workout> workouts,
    required individualresponses,
    required List<Survey> surveys}) {
    final userCollection = UserCollection(users);
    final individualresponseCollection =
    IndividualresponseCollection(individualresponses);
    final currentAuthUser = FirebaseAuth.instance.currentUser;
    String? currentUserEmail = currentAuthUser?.email;
    final currentUser = userCollection.getUser(currentUserEmail!);
    final surveyCollection = SurveyCollection(surveys);

    final items = [
      DropdownMenuItem(child: Text("1"), value: 1),
      DropdownMenuItem(child: Text("2"), value: 2),
      DropdownMenuItem(child: Text("3"), value: 3),
      DropdownMenuItem(child: Text("4"), value: 4),
      DropdownMenuItem(child: Text("5"), value: 5),
      DropdownMenuItem(child: Text("6"), value: 6),
      DropdownMenuItem(child: Text("7"), value: 7),
      DropdownMenuItem(child: Text("8"), value: 8),
      DropdownMenuItem(child: Text("9"), value: 9),
      DropdownMenuItem(child: Text("10"), value: 10),
    ];

    int calculateNewAvgHR(List<Individualresponse> responses) {
      List<int> toAverage = [];
      for (var response in responses) {
        toAverage.add(response.HR);
      }
      int total = 0;
      for (var value in toAverage) {
        total += value;
      }
      double average = total / toAverage.length;
      return average.round();
    }

    int calculateNewAvgSleep(List<Individualresponse> responses) {
      List<int> toAverage = [];
      for (var response in responses) {
        toAverage.add(response.Sleep);
      }
      int total = 0;
      for (var value in toAverage) {
        total += value;
      }
      double average = total / toAverage.length;
      return average.round();
    }

    int calculateNewAvgFatigue(List<Individualresponse> responses) {
      List<int> toAverage = [];
      for (var response in responses) {
        toAverage.add(response.Fatigue);
      }
      int total = 0;
      for (var value in toAverage) {
        total += value;
      }
      double average = total / toAverage.length;
      return average.round();
    }

    int calculateNewAvgDOMS(List<Individualresponse> responses) {
      List<int> toAverage = [];
      for (var response in responses) {
        toAverage.add(response.DOMS);
      }
      int total = 0;
      for (var value in toAverage) {
        total += value;
      }
      double average = total / toAverage.length;
      return average.round();
    }

    int calculateNewAvgDifficulty(List<Individualresponse> responses) {
      List<int> toAverage = [];
      for (var response in responses) {
        toAverage.add(response.Difficulty);
      }
      int total = 0;
      for (var value in toAverage) {
        total += value;
      }
      double average = total / toAverage.length;
      return average.round();
    }

    void updateLatestSurvey(Individualresponse newResponse) {
      Survey latestSurvey = surveyCollection.getLatestSurvey();

      List<Individualresponse> currentResponses = [newResponse];
      for (var responseID in latestSurvey.individualResponses) {
        currentResponses.add(
            individualresponseCollection.getResponse(responseID));
      }

      List<String> surveyFields = ["DOMS", "Difficulty", "Fatigue", "HR", "Sleep"];
      Object newAverages = {
        "DOMS": 0,
        "Difficulty": 0,
        "Fatigue": 0,
        "HR": 0,
        "Sleep": 0,
      };

      (newAverages as Map)["DOMS"] = calculateNewAvgDOMS(currentResponses);
      (newAverages as Map)["Difficulty"] = calculateNewAvgDifficulty(currentResponses);
      (newAverages as Map)["Fatigue"] = calculateNewAvgFatigue(currentResponses);
      (newAverages as Map)["HR"] = calculateNewAvgHR(currentResponses);
      (newAverages as Map)["Sleep"] = calculateNewAvgSleep(currentResponses);

      List<String> newResponseIDs = [];
      for(var response in currentResponses){
        newResponseIDs.add(response.id);
      }

      Survey updatedSurvey = Survey(
        id: latestSurvey.id,
        date: latestSurvey.date,
        avgFatigue: (newAverages as Map)["Fatigue"],
        avgSleep: (newAverages as Map)["Sleep"],
        avgDOMS: (newAverages as Map)["DOMS"],
        avgDifficulty: (newAverages as Map)["Difficulty"],
        avgHR: (newAverages as Map)["HR"],
        individualResponses: newResponseIDs,
      );

      ref.read(editSurveyControllerProvider.notifier).updateSurvey(
        survey: updatedSurvey,
        onSuccess: () {
        },
      );
    }

    void submitSurveyResponse() {
      int fatigue = _fatigueFormKey.currentState?.value;
      int sleep = _sleepFormKey.currentState?.value;
      int DOMS = _DOMSFormKey.currentState?.value;
      int difficulty = _difficultyFormKey.currentState?.value;
      String HR = _HRFormKey.currentState?.value;

      int numResponses = individualresponseCollection.size();

      String id = 'response-${(numResponses + 1).toString().padLeft(3, '0')}';

      Individualresponse newResponse = Individualresponse(
        id: id,
        name: userCollection
            .getUser(currentUserEmail)
            .name,
        Fatigue: fatigue,
        Sleep: sleep,
        DOMS: DOMS,
        Difficulty: difficulty,
        HR: int.parse(HR),
      );
      // add response to latest survey
      // recalculate averages for latest survey
      User updatedUser = User(
        id: currentUser.id,
        name: currentUser.name,
        email: currentUser.email,
        role: currentUser.role,
        workoutIDs: currentUser.workoutIDs,
        surveySubmitted: true,
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
        user: updatedUser,
        onSuccess: () {},
      );
      updateLatestSurvey(newResponse);
      IndividualresponseDatabase individualresponseDatabase = ref.watch(individualresponseDatabaseProvider);
      individualresponseDatabase.setIndividualresponse(newResponse);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Today's Survey"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        name: "Fatigue",
                        key: _fatigueFormKey,
                        decoration: InputDecoration(
                          labelText: "Fatigue",
                          hintText: "Enter Fatigue 0 to 7",
                        ),
                        items: items,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        items: items,
                        name: "Sleep",
                        key: _sleepFormKey,
                        decoration: InputDecoration(
                          labelText: "Sleep",
                          hintText: "Enter Sleep 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        items: items,
                        name: "DOMS",
                        key: _DOMSFormKey,
                        decoration: InputDecoration(
                          labelText: "DOMS",
                          hintText: "Enter DOMS 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        items: items,
                        name: "Difficulty",
                        key: _difficultyFormKey,
                        decoration: InputDecoration(
                          labelText: "Difficulty",
                          hintText: "Enter Difficulty 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: "HR",
                        key: _HRFormKey,
                        decoration: InputDecoration(
                          labelText: "HR",
                          hintText: "Enter HR",
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 375,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColorDark,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        submitSurveyResponse();
                      },
                      child: const Text('Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
