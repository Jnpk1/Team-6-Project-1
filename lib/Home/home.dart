import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:policy_voter/Authentication/auth.dart';
import 'package:policy_voter/Authentication/db.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:policy_voter/Home/policies.dart';
import 'policyObject.dart';

class Home extends StatelessWidget {
  final AuthenticateService _auth = AuthenticateService();
  List<Policy> x = [];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Policy>>.value(
        value: DataBaseService().policies,
        initialData: x,
        child: Scaffold(
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
            ),
            body: Policies()));
  }
}
