import 'package:coaching_app/features/user/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../agc_error.dart';
import '../../agc_loading.dart';
import '../all_data_provider.dart';
import 'check_box_item.dart';

class CheckBoxList extends ConsumerWidget {
  const CheckBoxList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          users: allData.users,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context, required List<User> users}) {
    return Scaffold(
      appBar: AppBar(title: const Text('CheckboxListTile Sample')),
      body: Column(
        children: <Widget>[
          ...users.map((user) => CheckboxListItem(user: user))
        ],
      ),
    );
  }
}