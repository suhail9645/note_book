import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_book/model/failure/failure.dart';
import 'package:note_book/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImp {
  Future<Failure?> signUpWithEmailAndPassword(UserMOdel userMOdel) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final userDetailes = await auth.createUserWithEmailAndPassword(
        email: userMOdel.email!,
        password: userMOdel.password!,
      );
      SharedPreferences shrd = await SharedPreferences.getInstance();
      shrd.setString('userUid', userDetailes.user!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      return Failure(error: 'Something wrong', message: e.message.toString());
    }
  }

  Future<Failure?> signInWithEmailAndPassword(UserMOdel userMOdel) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final userDetailes = await auth.signInWithEmailAndPassword(
          email: userMOdel.email!, password: userMOdel.password!);
      SharedPreferences shrd = await SharedPreferences.getInstance();
      shrd.setString('userUid', userDetailes.user!.uid);
      return null;
    } on FirebaseAuthException catch (_) {
      return Failure(
          error: 'Something wrong', message: 'No User With Given Detailes');
    }
  }

  Future<Failure?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
 try{

 
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      SharedPreferences shrd = await SharedPreferences.getInstance();
      shrd.setString('userUid', userCredential.user!.uid);
    }
    return null;
    }on FirebaseAuthException catch(e){
      return Failure(error: 'Something wrong', message: e.message.toString());
    }
  }
}
