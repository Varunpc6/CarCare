import 'dart:io';

import 'package:car_maintanance/hive_main/db/models/documents_db/document_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Doc {
  //creating singleton for making the class instances common
  Doc._instance();
  static Doc instance = Doc._instance();
  factory Doc({required String type}) {
    return instance;
  }

  final Box<DocumentModel> documentInitialBox =
      Hive.box<DocumentModel>('document_box');

// Add
  Future<void> addDocument({
    String? imageDoc,
    String? nameDoc,
    int? id,
  }) async {
    final newDoc = DocumentModel(
      imageDoc: imageDoc,
      nameDoc: nameDoc,
      id: id,
    );
    await documentInitialBox.add(newDoc);
  }

// Read
  List<DocumentModel> displayDoc() {
    return documentInitialBox.values.toList();
  }

// Update
  Future<void> updateDoc({
    int? index,
    String? imageDoc,
    String? nameDoc,
  }) async {
    final updateDoc = DocumentModel(
      imageDoc: imageDoc,
      nameDoc: nameDoc,
    );
    await documentInitialBox.add(updateDoc);
    await documentInitialBox.putAt(index!, updateDoc);
  }

// Delete
  Future<void> deleteDoc(int index) async {
    var deletedDoc = documentInitialBox.getAt(index);
    if (deletedDoc != null) {
      // stdout.write('Deleted user details: $deletedUser');
      await documentInitialBox.deleteAt(index);
      stdout.write('User details deleted successfully');
    } else {
      // stdout.write('User details not found at index $index');
    }
  }
}
