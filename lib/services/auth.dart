import 'package:firebase_auth/firebase_auth.dart';
import 'package:lofi/modal/my_user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser _userFromFirebaseUser(User user) {
    return user != null ? MyUser(userId: user.uid) : null;
  }

// * changes from video:
//FirebaseUser = User
//AuthResult = UserCredential
//User = MyUser
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }

  Future signInAnon() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      print('ERROR');
      print(e.toString());
    }
  }
}
