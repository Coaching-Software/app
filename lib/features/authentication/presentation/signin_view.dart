import 'package:flutter/material.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  static const routeName = '/signin';


  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                Text(
                  "Welcome to",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16.0),
                Image.asset('assets/images/mavs_logo.png', height: 200, width: 200,),
                const SizedBox(height: 16.0),
                Text(
                  "Remote Coaching",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            // [Name]
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushReplacementNamed(context, '/coachView');
                },
                child: const Text('Sign in')),
            const SizedBox(height: 12.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account? "),
              TextButton(
                child: const Text('Sign up'),
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushReplacementNamed(context, '/signup');
                },
              )
            ]),
          ],
        ),
      ),
    );
  }
}