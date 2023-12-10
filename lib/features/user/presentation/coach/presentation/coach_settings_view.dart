
import 'package:coaching_app/features/user/domain/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../../../all_data_provider.dart';
import '../../../../authentication/presentation/signin_view.dart';
import '../../../domain/user.dart';



/// High level display of the settings page.
class CoachSettingsView extends ConsumerWidget {
  const CoachSettingsView({
    super.key,
  });

  static const routeName = '/coachSettings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          ref: ref,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required WidgetRef ref,
  }) {
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
