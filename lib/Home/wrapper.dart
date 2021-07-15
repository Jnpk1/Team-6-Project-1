import 'package:flutter/material.dart';

import 'package:policy_voter/Authenticity/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:policy_voter/Authenticity/signin.dart';
import 'package:provider/provider.dart';
import 'package:policy_voter/Home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print(user);
    if (user == null) {
      return MaterialApp(home: AuthService());
    } else {
      return MaterialApp(home: Home());
    }
  }
}
