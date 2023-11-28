import 'package:coaching_app/features/workout/domain/workout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'individualresponse.dart';

/// Encapsulates operations on the list of [Individualresponse] returned from Firestore.
class IndividualresponseCollection{
  IndividualresponseCollection(individualresponses) : _individualresponses = individualresponses;

  final List<Individualresponse> _individualresponses;

  int size() {
    return _individualresponses.length;
  }

  Individualresponse getResponse(String responseID){
    return _individualresponses.firstWhere((repsonse) => responseID == repsonse.id);
  }
}
