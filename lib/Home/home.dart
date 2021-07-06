import 'package:flutter/material.dart';
import 'package:policy_voter/Authentication/auth.dart';

class Home extends StatelessWidget {
  final AuthenticateService _auth = AuthenticateService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text('Policy Picker'),
          backgroundColor: Colors.green[300],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
                icon: Icon(Icons.person),
                onPressed: () async {
                  await _auth.signOut();
                },
                label: Text('logout')),
          ],
        ));
  }
}
