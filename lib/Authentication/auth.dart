import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
