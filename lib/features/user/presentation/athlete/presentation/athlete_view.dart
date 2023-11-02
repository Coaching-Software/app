import 'package:flutter/material.dart';
import 'athlete_settings_view.dart';
import 'athlete_survey_view.dart';
import 'current_workouts_view.dart';



/// Top-level Layout for the app
class AthleteView extends StatefulWidget {
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
  };

  @override
  State<AthleteView> createState() => _AthleteViewState();
}

class _AthleteViewState extends State<AthleteView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(12.0),
        child: widget.pages[_selectedIndex]['body'],
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
