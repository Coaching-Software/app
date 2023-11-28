import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:coaching_app/features/user/presentation/athlete/presentation/survey_submitted_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../agc_error.dart';
import '../../../../../agc_loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../workout/domain/workout.dart';
import '../../../domain/user.dart';
import 'athlete_settings_view.dart';
import 'athlete_survey_view.dart';
import 'current_workouts_view.dart';



/// Top-level Layout for the app
class AthleteView extends ConsumerStatefulWidget {
  AthleteView({
    super.key,
  });

  static const routeName = '/athleteView';

  // This data structure will eventually become stateful and thus will
  // need to be moved into the state widget.
  final Map pages = {
    0: {
      'title': const Text('Workouts'),
      'body': CurrentWorkoutsView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Workouts',
        icon: Icon(Icons.directions_run_outlined ),
      ),
    },
    1: {
      'title': const Text('Survey'),
      'body': AthleteSurveyView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Survey',
        icon: Icon(Icons.format_align_justify_outlined),
      ),
    },
    2: {
      'title': const Text('Settings'),
      'body': const AthleteSettingsView(),
      'navItem': const BottomNavigationBarItem(
        label: 'Settings',
        icon: Icon(Icons.settings),
      ),
    },
    3: {
      'title': const Text('Survey'),
      'body': const SurveySubmitted(),
      'navItem': const BottomNavigationBarItem(
        label: 'Survey',
        icon: Icon(Icons.format_align_justify_outlined),
      ),
    },
  };

  @override
  AthleteViewState createState() => AthleteViewState();
}

class AthleteViewState extends ConsumerState<AthleteView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        if(index == 1){

        }
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
              context: context,
              workouts: allData.workouts,
              users: allData.users,
              individualresponses: allData.individualresponses,
              currentUserEmail: allData.currentUserEmail,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({required BuildContext context, required List<
      User> users, required List<Workout> workouts, required individualresponses, required currentUserEmail}) {

    final userCollection = UserCollection(users);
    bool hasSubmitted = userCollection.hasSubmittedSurvey(currentUserEmail);

    int showToAthlete(bool hasSubmitted){
      if(_selectedIndex == 0){
        return 0;
      }
      if(_selectedIndex == 2){
        return 2;
      }
      if(hasSubmitted){
        return 3;
      } else {
        return 1;
      }
    }


    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(12.0),
        child: widget.pages[showToAthlete(hasSubmitted)]['body'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // needed when more than 3 items
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          widget.pages[0]['navItem'],
          widget.pages[1]['navItem'],
          widget.pages[2]['navItem'],
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
