import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_book/model/failure/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/note_model/note_model.dart';

class NoteServices {
  late FirebaseFirestore firestore;
  late String docId;
  NoteServices._() {
    firestore = FirebaseFirestore.instance;
    getUserDocId();
  }
  Future<void> getUserDocId() async {
    SharedPreferences shrd = await SharedPreferences.getInstance();
    docId = shrd.getString('userUid')!;
  }

  static final instance = NoteServices._();
  Future<Failure?> noteAddService(Note noteModel) async {
    try {
      firestore
          .collection('All Data')
          .doc(docId)
          .collection('Data')
          .add({'heading': noteModel.heading, 'content': noteModel.content});
      // await firestore
      //     .collection('Notes')
      //     .add({'heading': noteModel.heading, 'content': noteModel.content});
      return null;
    } on FirebaseException catch (e) {
      return Failure(error: 'Something wrong', message: e.message.toString());
    } catch (e) {
      return Failure(error: '', message: 'Please try again');
    }
  }
}
