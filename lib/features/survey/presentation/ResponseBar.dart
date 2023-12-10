import 'package:coaching_app/features/individual_response/domain/individualresponse.dart';
import 'package:coaching_app/features/individual_response/domain/individualresponse_collection.dart';
import 'package:coaching_app/features/survey/presentation/response_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../error.dart';
import '../../../../../loading.dart';
import '../../all_data_provider.dart';

/// Displays basic user info in a bar given a UserID
class ResponseBar extends ConsumerWidget {
  const ResponseBar({
    super.key,
    required this.responseID,
  });

  final String responseID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
          context: context,
          responses: allData.individualresponses,
        ),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
        required List<Individualresponse> responses}) {

    final responseCollection = IndividualresponseCollection(responses);
    Individualresponse currentResponse = responseCollection.getResponse(responseID);

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: MaterialButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResponseItemPage(
                    responseID: responseID,
                  )),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(currentResponse.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
