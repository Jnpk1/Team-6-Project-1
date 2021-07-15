import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'policyObject.dart';
import 'policy_tile.dart';

class Policies extends StatefulWidget {
  @override
  _PoliciesState createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    final policies = Provider.of<List<Policy>>(context);
    //print(policies!.docs);

    policies.forEach((policy) {
      print(policy.title);
      print(policy.desc);
    });
    return ListView.builder(
      itemCount: policies.length,
      itemBuilder: (context, index) {
        return PolicyTile(policy: policies[index]);
      },
    );
  }
}
