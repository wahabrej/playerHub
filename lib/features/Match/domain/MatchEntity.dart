class MatchEntity {
  final String id;
  final String name;
  final String? logo;
  final int totalGoals;
  final String date;
  final String startTime;
  final String endTime;
  final String stadium;
  final String matchStatus;
  final String status;
  final bool votingOpen;

  MatchEntity({
    required this.id,
    required this.name,
    this.logo,
    required this.totalGoals,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.stadium,
    required this.matchStatus,
    required this.status,
    required this.votingOpen,
  });
}
