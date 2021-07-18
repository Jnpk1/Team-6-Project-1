import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:policy_voter/Authenticity/authService.dart';
import 'package:policy_voter/Home/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:policy_voter/Authentication/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  User? x = null;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: x,
      value: AuthenticateService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

