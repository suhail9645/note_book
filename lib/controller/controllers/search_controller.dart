

import 'package:flutter/material.dart';
import 'package:note_book/model/note_model/note_model.dart';

class SearchResultController extends ChangeNotifier{
  List<Note>searchResult=[];
  List<Note>allNotes=[];
  String query='';
  bool isSearch=false;
void searchNotes(String sQuery){
  isSearch=true;
  searchResult.clear();
  query=sQuery;
  notifyListeners();
  for (var element in allNotes) {
    if(element.heading.toLowerCase().contains(query.toLowerCase())){
      searchResult.add(element);
    }
  }
  notifyListeners();
 

}
void onCancelSearch(){
isSearch=false;
query='';
notifyListeners();
}

}