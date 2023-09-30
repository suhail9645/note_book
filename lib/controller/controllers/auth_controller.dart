import 'package:flutter/cupertino.dart';
import 'package:note_book/controller/services/auth_services.dart';
import 'package:note_book/model/failure/failure.dart';
import 'package:note_book/model/user/user_model.dart';

class AuthController extends ChangeNotifier{
  bool isLoading=false;
  bool isSuccess=false;  Failure? failure;
  void onSignUp(UserMOdel userMOdel)async{
   isLoading=true;
   notifyListeners();

 failure=await AuthServiceImp().signUpWithEmailAndPassword(userMOdel);
 isLoading=false;
 notifyListeners();
 if(failure==null){
isSuccess=true;
notifyListeners();
 }
  }
  void onSignIn(UserMOdel userMOdel)async{
    isLoading=true;
    notifyListeners();
    failure=await AuthServiceImp().signInWithEmailAndPassword(userMOdel); 
    isLoading=false;
 notifyListeners();
 if(failure==null){
isSuccess=true;
notifyListeners();
 }
  }
 void onGoogleSignin()async{
  isLoading=true;
    notifyListeners();
failure=await AuthServiceImp().signInWithGoogle(); 
isLoading=false;
 notifyListeners();
 if(failure==null){
isSuccess=true;
notifyListeners();
 }
 } 
}
