import 'package:flutter/material.dart';


/// Middle-level Layout for the profile view, shows either classes or groups for currently signin user
class AthleteSurveyView extends StatelessWidget {
  AthleteSurveyView({
    super.key,
  });

  static const routeName = '/athleteSurveyView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Current Survey"),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
            children: [
              Row(
                children: [Text("List Item")],
              ),
              Row(
                children: [Text("List Item")],
              ),
              Row(
                children: [Text("List Item")],
              )
            ]
        ),
      ),
    );
  }

}