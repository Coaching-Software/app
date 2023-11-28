
import 'package:flutter/material.dart';

/// Displays a form for creating a group.
class SurveySubmitted extends StatelessWidget {
  const SurveySubmitted({
    super.key,
  });

  static const routeName = '/surveySubmitted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Today's Survey"),
        ],
      ),
    ),
      body: const Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("You have already submitted today's survey.", style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
