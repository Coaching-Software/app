
import 'package:flutter/material.dart';


import 'features/authentication/presentation/signin_view.dart';
import 'new_workout.dart';

/// High level display of the settings page.
class CoachHomeView extends StatelessWidget {
  const CoachHomeView({
    super.key,
  });

  static const routeName = '/coachHome';

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 55,
                width: 375,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewWorkout()),
                    );
                  },
                  child: Text('New Workout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 55,
                width: 375,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninView()),
                    );
                  },
                  child: Text('New Survey',
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
