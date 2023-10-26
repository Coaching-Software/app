import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coach_home_view.dart';
import 'coach_settings_view.dart';
import 'coach_view.dart';
import 'features/authentication/presentation/athlete_signup.dart';
import 'features/authentication/presentation/coach_signup.dart';
import 'features/authentication/presentation/signin_view.dart';
import 'features/authentication/presentation/signup_view.dart';
import 'history_view.dart';
import 'new_workout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SigninView(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SigninView.routeName:
                return SigninView();
              case SignupView.routeName:
                return SignupView();
              case CoachSignupView.routeName:
                return CoachSignupView();
              case AthleteSignupView.routeName:
                return AthleteSignupView();
              case CoachSettingsView.routeName:
                return CoachSettingsView();
              case HistoryView.routeName:
                return HistoryView();
              case CoachHomeView.routeName:
                return CoachHomeView();
              case CoachView.routeName:
                return CoachView();
              case NewWorkout.routeName:
                return NewWorkout();
              default:
                return SigninView();
            }
          },
        );
      },
    );
  }
}