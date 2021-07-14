import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:policy_voter/Home/policyObject.dart';

class DataBaseService {
  final CollectionReference policyCollection =
      FirebaseFirestore.instance.collection('Policies');

  Future grabPolicies() async {
    return null;
  }

  List<Policy> _policyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Policy(
          title: doc.get('title'),
          desc: doc.get('desc'),
          votesNo: doc.get('votesNo'),
          votesYes: doc.get('votesYes'),
          usersVoted: doc.get('usersVoted'));
    }).toList();
  }

  Stream<List<Policy>> get policies {
    return policyCollection.snapshots().map(_policyListFromSnapshot);
  }
}
