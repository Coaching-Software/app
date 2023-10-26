import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/authentication/presentation/athlete_signup.dart';
import 'features/authentication/presentation/coach_signup.dart';
import 'features/authentication/presentation/signin_view.dart';
import 'features/authentication/presentation/signup_view.dart';

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
              default:
                return SigninView();
            }
          },
        );
      },
    );
  }
}