import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/entry_model.dart';
import '../services/firebase_services.dart';

class EntryRepository {
  CollectionReference<EntryModel> ref =
  FirebaseService.db.collection("entries")
      .withConverter<EntryModel>(
    fromFirestore: (snapshot, _) {
      return EntryModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );

  Stream<QuerySnapshot<EntryModel>> getData() {
    Stream<QuerySnapshot<EntryModel>> response = ref
        .snapshots();
    return response;
  }

  Future<EntryModel?> getOneData(String id) async {
    DocumentSnapshot<EntryModel> response =
    await ref.doc(id).get();
    return response.data();
  }

  //delete function
  Future<void> deleteEntry(String id) async {
    await ref.doc(id).delete();
  }
}
