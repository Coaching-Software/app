import 'package:coaching_app/features/authentication/presentation/select_role_view.dart';
import 'package:coaching_app/features/user/presentation/athlete/presentation/athlete_view.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../agc_error.dart';
import '../../../agc_loading.dart';
import '../../all_data_provider.dart';
import '../../page_not_found_view.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../../user/presentation/coach/presentation/coach_view.dart';
import '../../user/presentation/edit_user_controller.dart';
import 'decorations.dart';
import 'forgot_password_view.dart';
import 'verify_email_view.dart';

/// Builds the page containing fields to enter a username and password, plus buttons.
class SignInView extends ConsumerWidget {
  const SignInView({Key? key}) : super(key: key);

  static const routeName = '/';

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
    required List<User> users,
    required WidgetRef ref,
  }) {
    final userCollection = UserCollection(users);
    return SignInScreen(
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            ForgotPasswordView.routeName,
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
         User user = userCollection.getUser(state.user!.email!);
          if (!state.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            if (user.role == 'null') {
              Navigator.pushReplacementNamed(context, SelectRoleView.routeName);
            } else if (user.role == "coach") {
              Navigator.pushReplacementNamed(context, CoachView.routeName);
            } else if (user.role == "athlete") {
              Navigator.pushReplacementNamed(context, AthleteView.routeName);
            } else {
              Navigator.pushReplacementNamed(context, PageNotFoundView.routeName);
            }

          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (!state.credential.user!.emailVerified) {
            String email = state.credential.user?.email ?? '';
            int numUsers = userCollection.size();
            String id = 'user-${(numUsers + 1).toString().padLeft(3, '0')}';
            User newUser = User(
                id: id,
                role: 'null',
                name: email,
                email: email,
                workoutIDs: [],
              surveySubmitted: false,
            );
            ref.read(editUserControllerProvider.notifier).updateUser(
              user: newUser,
              onSuccess: () {},
            );
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, SelectRoleView.routeName);
          }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          if (!state.user.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, SelectRoleView.routeName);
          }
        }),
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },
      headerBuilder: headerImage('assets/images/mavs_logo.png'),
      sideBuilder: sideImage('assets/images/mavs_logo.png'),
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            action == AuthAction.signIn
                ? 'Welcome to Welcome to Mavs Remote Coaching'
                : 'Welcome to Welcome to Mavs Remote Coaching! Please create an account.',
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
