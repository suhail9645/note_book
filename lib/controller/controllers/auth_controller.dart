import 'package:flutter/cupertino.dart';
import 'package:note_book/controller/services/auth_services.dart';
import 'package:note_book/model/failure/failure.dart';

class AuthController extends ChangeNotifier{
  bool isLoading=false;
  bool isSuccess=false;  Failure? failure;
  void onSignUp(String email,String password)async{
   isLoading=true;
   notifyListeners();

 failure=await AuthServiceImp().signUpWithEmailAndPassword(email, password);
 isLoading=false;
 isSuccess=true;
 notifyListeners();
  }
}