import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

//anonymous sign in
  Future anonSign() async {
    try {
      UserCredential logInStatus = await _auth.signInAnonymously();
      User loggedInUser = logInStatus.user as User;
      return loggedInUser;
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
