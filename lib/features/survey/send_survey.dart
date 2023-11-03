
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

/// Displays a form for creating a group.
class SendSurvey extends StatelessWidget {
  SendSurvey({
    super.key,
  });

  static const routeName = '/newSurvey';

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('en_US');
    String formattedDate = formatter.format(now);

    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white),"Select Athletes"),
        backgroundColor: Theme.of(context).primaryColor,
      ),

       */
      appBar: AppBar(
        title: Text(formattedDate, style: const TextStyle(color: Colors.white, fontSize: 30)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("This button sends a survey to all registered athletes. The suvey includes response options for fatigue, sleep, DOMS, workout difficulty, and resting HR. Individual responses and averages can be accessed through survey history. Only one survey can be sent per day.", style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ],
          ),
          SizedBox(height: 30,),
          // Create Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 45,
                width: 375,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    /// TODO: add workout to database
                  },
                  child: const Text('Send',
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
