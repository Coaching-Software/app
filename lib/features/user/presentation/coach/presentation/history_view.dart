import 'package:flutter/material.dart';

import '../../../../survey/survey_history.dart';
import '../../../../workout/presentation/workout_history.dart';


/// Middle-level Layout for the profile view, shows either classes or groups for currently signin user
class HistoryView extends StatefulWidget {
  HistoryView({
    super.key,
  });

  static const routeName = '/historyView';

  // This data structure will eventually become stateful and thus will
  // need to be moved into the state widget.
  final Map pages = {
    0: {
      'body': const WorkoutHistory(),
    },
    1: {
      'body': const SurveyHistory(),
    },
  };

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (0 != _selectedIndex) {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      }
                    },
                    child: const Text('Workouts',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (1 != _selectedIndex) {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      }
                    },
                    child: const Text('Surveys',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
              ),
            ],
        ),
          ),
        
      ),
      body: widget.pages[_selectedIndex]['body'],
    );
  }
}
