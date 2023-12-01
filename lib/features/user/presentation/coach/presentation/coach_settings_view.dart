
import 'package:flutter/material.dart';

import '../../../../authentication/presentation/signin_view.dart';



/// High level display of the settings page.
class CoachSettingsView extends StatelessWidget {
  const CoachSettingsView({
    super.key,
  });

  static const routeName = '/coachSettings';

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInView()),
                      );
                    },
                    child: const Text('Logout',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
