import 'package:flutter/material.dart';

import 'package:policy_voter/Authenticity/authService.dart';
import 'package:policy_voter/Authenticity/signin.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthService());
  }
}
