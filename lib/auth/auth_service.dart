import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instances of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up


  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }


  //errors

}