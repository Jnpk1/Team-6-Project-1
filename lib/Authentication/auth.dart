import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future signInAccount(String email, String password) async {
    try {
      UserCredential signedInUserCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User signedInUser = signedInUserCred.user as User;
      return signedInUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerAccount(String email, String password) async {
    try {
      UserCredential registeredUserCred = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User registeredUser = registeredUserCred.user as User;
      return registeredUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
