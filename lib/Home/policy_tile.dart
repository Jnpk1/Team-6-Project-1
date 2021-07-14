import 'package:flutter/material.dart';
import 'policyObject.dart';

class PolicyTile extends StatelessWidget {
  final Policy policy;
  PolicyTile({required this.policy});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue[400],
                ),
                title: Text(policy.title),
                subtitle: Text('Votes For : ' +
                    policy.votesYes.toString() +
                    '\nVotes Against : ' +
                    policy.votesNo.toString()))));
  }
}
