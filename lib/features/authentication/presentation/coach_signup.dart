import 'package:flutter/material.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class CoachSignupView extends StatefulWidget {
  const CoachSignupView({Key? key}) : super(key: key);

  static const routeName = '/signupCoach';

  @override
  State<CoachSignupView> createState() => _CoachSignupViewState();
}

class _CoachSignupViewState extends State<CoachSignupView> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                const SizedBox(height: 16.0),
                Text(
                  "Sign Up As a Coach",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
            const SizedBox(height: 20.0),
            // [Name]
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('Sign up')),
          ],
        ),
      ),
    );
  }
}