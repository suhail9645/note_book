
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_book/model/failure/failure.dart';
import 'package:note_book/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImp {
  Future<Failure?>signUpWithEmailAndPassword(UserMOdel userMOdel)async{
   FirebaseAuth auth=FirebaseAuth.instance;
   try{
  final userDetailes=  await auth.createUserWithEmailAndPassword(
        email: userMOdel.email!,
        password: userMOdel.password!,
      );
  SharedPreferences shrd=await SharedPreferences.getInstance();
  shrd.setString('userUid', userDetailes.user!.uid);
    return null;
  }on FirebaseAuthException catch(e){
    return Failure(error: 'Something wrong', message: e.message.toString());
    
  }
 
  }
}