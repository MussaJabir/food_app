import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //Get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //Sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    //Trying to sign in the user
    try {
      //Sign user in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }
    //Catch any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    //Trying to sign in the user
    try {
      //Sign user in
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }
    //Catch any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//Sigh out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}