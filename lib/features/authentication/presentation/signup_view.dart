import 'package:flutter/material.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  static const routeName = '/signup';

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 40.0),
            Column(
              children: <Widget>[
                Image.asset('assets/images/mavs_logo.png', width: 100),
                const SizedBox(height: 50.0),
                const Text(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  "I am a",
                ),
                const SizedBox(height: 50.0),
                Container(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/signupCoach'),
                      child: const Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                          "Coach")),
                ),
                const SizedBox(height: 30.0),
                Container(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/signupAthlete'),
                      child: const Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                          "Athlete")),
                ),
                const SizedBox(height: 20.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account? "),
                  TextButton(
                    child: const Text('Sign in'),
                    onPressed: () {
                      // Eventually: pushReplacementNamed
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
