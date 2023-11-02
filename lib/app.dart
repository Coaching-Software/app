import 'package:coaching_app/features/authentication/presentation/forgot_password_view.dart';
import 'package:coaching_app/features/authentication/presentation/select_role_view.dart';
import 'package:coaching_app/features/authentication/presentation/verify_email_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/signin_view.dart';
import 'features/user/presentation/athlete/presentation/athlete_settings_view.dart';
import 'features/user/presentation/athlete/presentation/athlete_survey_view.dart';
import 'features/user/presentation/athlete/presentation/athlete_view.dart';
import 'features/user/presentation/athlete/presentation/current_workouts_view.dart';
import 'features/user/presentation/coach/presentation/coach_home_view.dart';
import 'features/user/presentation/coach/presentation/coach_settings_view.dart';
import 'features/user/presentation/coach/presentation/coach_view.dart';
import 'features/authentication/presentation/athlete_signup.dart';
import 'features/authentication/presentation/coach_signup.dart';
import 'features/page_not_found_view.dart';
import 'features/user/presentation/coach/presentation/history_view.dart';
import 'features/user/presentation/coach/presentation/new_workout.dart';

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
      home: const SignInView(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SignInView.routeName:
                return SignInView();
              case ForgotPasswordView.routeName:
                return ForgotPasswordView();
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
              case AthleteSettingsView.routeName:
                return AthleteSettingsView();
              case AthleteSurveyView.routeName:
                return AthleteSurveyView();
              case CurrentWorkoutsView.routeName:
                return CurrentWorkoutsView();
              case AthleteView.routeName:
                return AthleteView();
              case VerifyEmailView.routeName:
                return VerifyEmailView();
              case SelectRoleView.routeName:
                return SelectRoleView();
              default:
                return PageNotFoundView();
            }
          },
        );
      },
    );
  }
}