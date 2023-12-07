import 'package:coaching_app/features/authentication/presentation/select_role_view.dart';
import 'package:coaching_app/features/authentication/presentation/signin_view.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../error.dart';
import '../../../loading.dart';
import '../../all_data_provider.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../../user/presentation/athlete/presentation/current_workouts_view.dart';
import '../../page_not_found_view.dart';
import '../../user/presentation/coach/presentation/coach_home_view.dart';
import '../../user/presentation/coach/presentation/coach_view.dart';
import 'decorations.dart';

/// Builds the page to support email verification.
class VerifyEmailView extends ConsumerWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  static const routeName = '/verify-email';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            users: allData.users,
            ref: ref),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required List<User> users, required WidgetRef ref,
  }) {
    return EmailVerificationScreen(
      headerBuilder: headerIcon(Icons.verified),
      sideBuilder: sideIcon(Icons.verified),
      actions: [
        EmailVerifiedAction(() {
          Navigator.pushReplacementNamed(context, SelectRoleView.routeName);
        }),
        AuthCancelledAction((context) {
          FirebaseUIAuth.signOut(context: context);
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }),
      ],
    );
  }
}
