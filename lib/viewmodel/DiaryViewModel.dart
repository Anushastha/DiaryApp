import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/entry_model.dart';
import '../repository/entry_repository.dart';

class EntryViewModel with ChangeNotifier{
  EntryRepository _entryRepository = EntryRepository();
  Stream<QuerySnapshot<EntryModel>>? _entry;
  Stream<QuerySnapshot<EntryModel>>? get entry => _entry;

  Future<void> getEntry()async{
    var response = _entryRepository.getData();

    _entry = response;
    // notifyListeners();
  }

  Future<void> deleteEntry(String id) async{
    await _entryRepository.deleteEntry(id);
    // notifyListeners();
  }
}