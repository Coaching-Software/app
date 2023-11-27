import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Middle-level Layout for the profile view, shows either classes or groups for currently signin user
class AthleteSurveyView extends StatelessWidget {
  AthleteSurveyView({
    super.key,
  });

  static const routeName = '/athleteSurveyView';
  final _formKey = GlobalKey<FormBuilderState>();
  final _fatigueFormKey = GlobalKey<FormBuilderFieldState>();
  final _sleepFormKey = GlobalKey<FormBuilderFieldState>();
  final _DOMSFormKey = GlobalKey<FormBuilderFieldState>();
  final _difficultyFormKey = GlobalKey<FormBuilderFieldState>();
  final _HRFormKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Today's Survey"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: "Fatigue",
                        key: _fatigueFormKey,
                        decoration: InputDecoration(
                          labelText: "Fatigue",
                          hintText: "Enter Fatigue 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: "Sleep",
                        key: _sleepFormKey,
                        decoration: InputDecoration(
                          labelText: "Sleep",
                          hintText: "Enter Sleep 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: "DOMS",
                        key: _DOMSFormKey,
                        decoration: InputDecoration(
                          labelText: "DOMS",
                          hintText: "Enter DOMS 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: "Difficulty",
                        key: _difficultyFormKey,
                        decoration: InputDecoration(
                          labelText: "Difficulty",
                          hintText: "Enter Difficulty 0 to 7",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: "HR",
                        key: _HRFormKey,
                        decoration: InputDecoration(
                          labelText: "HR",
                          hintText: "Enter HR",
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 375,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        /// TODO: add survey to databases, update averages?
                      },
                      child: const Text('Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
