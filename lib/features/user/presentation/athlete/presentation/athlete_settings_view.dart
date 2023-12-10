import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../authentication/presentation/signin_view.dart';
import '../../../domain/user.dart';
import '../../../domain/edit_user_controller.dart';

/// Displays athlete settings: change name and logout.
class AthleteSettingsView extends ConsumerWidget {
  AthleteSettingsView({
    super.key,
  });

  static const routeName = '/athleteSettings';

  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFormKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
              context: context,
              users: allData.users,
              ref: ref,
            ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required List<User> users,
      required WidgetRef ref}) {

    final currentAuthUser = FirebaseAuth.instance.currentUser;
    String? currentUserEmail = currentAuthUser?.email;

    final userCollection = UserCollection(users);
    User currentUser = userCollection.getUser(currentUserEmail!);

    void changeName(){
      String newName = _nameFormKey.currentState?.value;
      User updatedUser = User(
        id: currentUser.id,
        name: newName,
        email: currentUser.email,
        role: currentUser.role,
        workoutIDs: currentUser.workoutIDs,
        surveySubmitted: currentUser.surveySubmitted,
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
        user: updatedUser,
        onSuccess: () {},
      );
    }


    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          FormBuilder(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FormBuilderTextField(
                name: "name",
                key: _nameFormKey,
                decoration: InputDecoration(
                  labelText: "Edit Your Name",
                  hintText: currentUser.name,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      changeName();
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
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
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
