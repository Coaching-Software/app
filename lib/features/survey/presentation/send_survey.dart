import 'package:coaching_app/features/survey/data/survey_database.dart';
import 'package:coaching_app/features/survey/domain/survey_collection.dart';
import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../error.dart';
import '../../../loading.dart';
import '../../all_data_provider.dart';
import '../../global_snackbar.dart';
import '../../user/domain/user.dart';
import '../data/survey_providers.dart';
import '../domain/survey.dart';

/// Displays a button to send a new Survey.
class SendSurvey extends ConsumerWidget {
  SendSurvey({
    super.key,
  });

  static const routeName = '/newSurvey';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
              context: context,
              users: allData.users,
              surveys: allData.surveys,
              ref: ref,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required List<User> users,
      required WidgetRef ref,
      required List<Survey> surveys}) {
    final userCollection = UserCollection(users);
    final surveyCollection = SurveyCollection(surveys);

    final now = DateTime.now();
    var titleFormatter = DateFormat.yMMMMd('en_US');
    var surveyDateFormatter = DateFormat.yMMMd('en_US');
    String titleFormattedDate = titleFormatter.format(now);

    void addSurvey() {
      int numSurveys = surveyCollection.size();
      String id = 'survey-${(numSurveys + 1).toString().padLeft(3, '0')}';

      Survey newSurvey = Survey(
        id: id,
        date: surveyDateFormatter.format(now),
        avgFatigue: -1,
        avgSleep: -1,
        avgDOMS: -1,
        avgDifficulty: -1,
        avgHR: -1,
        individualResponses: [],
      );
      SurveyDatabase surveyDatabase = ref.watch(surveyDatabaseProvider);
      surveyDatabase.setSurvey(newSurvey);
    }

    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white),"Select Athletes"),
        backgroundColor: Theme.of(context).primaryColor,
      ),

       */
      appBar: AppBar(
        title: Text(titleFormattedDate,
            style: const TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    "This button sends a survey to all registered athletes. The survey includes response options for fatigue, sleep, DOMS, workout difficulty, and resting HR. Individual responses and averages can be accessed through survey history. It is recommended that only one survey is sent per day",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // Create Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 45,
                width: 375,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    userCollection.sendNewSurvey(ref);
                    addSurvey();
                    GlobalSnackBar.show('New Survey Sent!', context);
                  },
                  child: const Text('Send',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
