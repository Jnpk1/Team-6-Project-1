import 'package:flutter/material.dart';
import 'package:policy_voter/Authenticity/signin.dart';

class AuthService extends StatefulWidget {
  @override
  _AuthServiceState createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService> {
  @override
  Widget build(BuildContext context) {
    return Container(child: signin());
  }
}
