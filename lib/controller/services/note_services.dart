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
  Stream<QuerySnapshot<Map<String, dynamic>>>fetchAllNotes()async*{
    final data=firestore.collection('All Data')
          .doc(docId)
          .collection('Data').snapshots();
   yield* data;
  }
  Future<Failure?>deleteNote(String id)async{
    try{
      await firestore.collection('All Data').doc(docId).collection('Data').doc(id).delete();
      return null;
    }
    on FirebaseException catch(e){
      return Failure(error: 'Something wrong', message: e.message.toString());
    }
    catch(e){
      return Failure(error: 'Somehting Wrong', message: 'Please Try againg');
    }
  }
}
