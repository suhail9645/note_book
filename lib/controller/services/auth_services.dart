
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_book/model/failure/failure.dart';

class AuthServiceImp {
  Future<Failure?>signUpWithEmailAndPassword(String email,String password)async{
   FirebaseAuth auth=FirebaseAuth.instance;
   try{
    await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    return null;
  }on FirebaseAuthException catch(e){
    return Failure(error: 'Something wrong', message: e.message.toString());
    
  }
 
  }
}