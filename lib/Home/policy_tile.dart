import 'package:flutter/material.dart';
import 'policyObject.dart';

class PolicyTile extends StatelessWidget {
  final Policy policy;
  PolicyTile({required this.policy});
  Color x = Colors.blue;

  @override
  Widget build(BuildContext context) {
    if (policy.votesNo > policy.votesYes) {
      x = Colors.red;
    } else if (policy.votesNo < policy.votesYes) {
      x = Colors.green;
    }
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
              minLeadingWidth: 10,
              minVerticalPadding: 10,
              leading: Icon(Icons.how_to_vote_sharp, size: 28, color: x),
              title: Text(policy.title +
                  '\n(' +
                  policy.votesYes.toString() +
                  ':Yes ' +
                  policy.votesNo.toString() +
                  ':No)'),
              subtitle: Text(policy.desc),
              trailing: Wrap(children: <Widget>[
                IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.check,
                      size: 35,
                    ),
                    onPressed: () {
                      print('voted Yes');
                    },
                    color: Colors.green),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 35,
                    ),
                    onPressed: () {
                      print('voted No');
                    },
                    color: Colors.red)
              ]),
            )));
  }
}
