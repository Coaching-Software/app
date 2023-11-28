import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../domain/individualresponse.dart';
import 'individualresponse_database.dart';

part 'individualresponse_providers.g.dart';

@riverpod
IndividualresponseDatabase individualresponseDatabase(IndividualresponseDatabaseRef ref) {
  return IndividualresponseDatabase(ref);
}

@riverpod
Stream<List<Individualresponse>> individualresponses(IndividualresponsesRef ref) {
  final database = ref.watch(individualresponseDatabaseProvider);
  return database.watchIndividualresponses();
}