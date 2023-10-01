import 'package:flutter/foundation.dart';
import 'package:note_book/controller/services/note_services.dart';
import 'package:note_book/model/failure/failure.dart';
import 'package:note_book/model/note_model/note_model.dart';

class NoteController extends ChangeNotifier{
  bool isLoading=false;
  bool isSuccess=false;
  Failure?failure;
  Future<void>addNoteToFireBase(Note note)async{
    isLoading=true;
    notifyListeners();
    NoteServices noteServices=NoteServices.instance;
  failure=await noteServices.noteAddService(note);
  if(failure==null){
    isSuccess=true;
    notifyListeners();
  }
  isLoading=false;
  notifyListeners();
  }
}