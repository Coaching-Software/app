import 'package:coaching_app/features/user/domain/user.dart';
import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:coaching_app/features/user/presentation/coach/presentation/coach_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../global_snackbar.dart';
import '../../user/presentation/athlete/presentation/athlete_view.dart';
import '../../user/presentation/edit_user_controller.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class SelectRoleView extends ConsumerWidget {
  const SelectRoleView({Key? key}) : super(key: key);

  static const routeName = '/selectRoleView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
              context: context,
              currentUserEmail: allData.currentUserEmail,
              users: allData.users,
              ref: ref,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required String currentUserEmail,
    required WidgetRef ref,
    required List<User> users,
  }) {
    final userCollection = UserCollection(users);
    User currentUser = userCollection.getUser(currentUserEmail);

    void assignRoleCoach() {
      String newRole = "coach";
      User updatedUser = User(
        id: currentUser.id,
        name: currentUser.name,
        role: newRole,
        email: currentUser.email,
        workoutIDs: currentUser.workoutIDs,
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
            user: updatedUser,
            onSuccess: () {
              GlobalSnackBar.show('Updated User Role');
            },
          );
      Navigator.pushReplacementNamed(context, CoachView.routeName);
    }

    void assignRoleAthlete() {
      String newRole = "athlete";
      User updatedUser = User(
        id: currentUser.id,
        name: currentUser.name,
        role: newRole,
        email: currentUser.email,
        workoutIDs: currentUser.workoutIDs,
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
            user: updatedUser,
            onSuccess: () {
              GlobalSnackBar.show('Updated User Role');
            },
          );
      Navigator.pushReplacementNamed(context, AthleteView.routeName);
    }

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
                      onPressed: () {
                        assignRoleCoach();
                      },
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
                      onPressed: () {
                        assignRoleAthlete();
                      },
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
