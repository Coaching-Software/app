import 'package:flutter/material.dart';


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
      'body': const WorkoutHistoryView(),
    },
    1: {
      'body': const SurveyHistoryView(),
    },
  };

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class WorkoutHistoryView extends StatelessWidget{
  const WorkoutHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Workouts");
  }
}

class SurveyHistoryView extends StatelessWidget{
  const SurveyHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Surveys");
  }
}

class _HistoryViewState extends State<HistoryView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            const SizedBox(width: 20,),
            Container(
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
          ],
        )
      ),
      body: widget.pages[_selectedIndex]['body'],
    );
  }
}
