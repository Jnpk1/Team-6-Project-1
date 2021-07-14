class Policy {
  final String title;
  final String desc;
  final num votesYes;
  final num votesNo;
  final List<dynamic> usersVoted;

  Policy(
      {required this.title,
      required this.desc,
      required this.votesYes,
      required this.votesNo,
      required this.usersVoted});
}
