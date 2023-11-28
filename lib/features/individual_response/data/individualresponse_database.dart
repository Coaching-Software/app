import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/individualresponse.dart';

// Provides access to the Firestore database storing Individualresponse documents.
class IndividualresponseDatabase {
  IndividualresponseDatabase(this.ref);

  final ProviderRef<IndividualresponseDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Individualresponse>> watchIndividualresponses() => _service.watchCollection(
      path: FirestorePath.individualresponses(),
      builder: (data, documentId) => Individualresponse.fromJson(data!));

  Stream<Individualresponse> watchIndividualresponse(String individualresponseId) => _service.watchDocument(
      path: FirestorePath.individualresponse(individualresponseId),
      builder: (data, documentId) => Individualresponse.fromJson(data!));

  Future<List<Individualresponse>> fetchIndividualresponses() => _service.fetchCollection(
      path: FirestorePath.individualresponses(),
      builder: (data, documentId) => Individualresponse.fromJson(data!));

  Future<Individualresponse> fetchIndividualresponse(String individualresponseId) => _service.fetchDocument(
      path: FirestorePath.individualresponse(individualresponseId),
      builder: (data, documentId) => Individualresponse.fromJson(data!));

  Future<void> setIndividualresponse(Individualresponse individualresponse) =>
      _service.setData(path: FirestorePath.individualresponse(individualresponse.id), data: individualresponse.toJson());

  deleteIndividualresponse(Individualresponse individualresponse) {}

}
