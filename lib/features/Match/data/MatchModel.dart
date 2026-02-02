class MatchModel {
  List<Matches>? matches;
  int? currentPage;
  int? totalPages;
  int? totalMatches;

  MatchModel({
    this.matches,
    this.currentPage,
    this.totalPages,
    this.totalMatches,
  });

  MatchModel.fromJson(Map<String, dynamic> json) {
    matches = (json['matches'] as List?)
        ?.map((e) => Matches.fromJson(e))
        .toList();

    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalMatches = json['totalMatches'];
  }

  Map<String, dynamic> toJson() {
    return {
      'matches': matches?.map((e) => e.toJson()).toList(),
      'currentPage': currentPage,
      'totalPages': totalPages,
      'totalMatches': totalMatches,
    };
  }
}

////////////////////////////////////////////////////////////

class Matches {
  TeamA? teamA;
  TeamB? teamB;
  String? id;
  String? date;
  String? startTime;
  String? endTime;
  String? stadium;
  Manager? manager;
  String? matchStatus;
  bool? votingOpen;
  String? status;
  int? elapsedMs;
  String? stopwatchTime;
  List<dynamic>? handoverVoting;
  List<dynamic>? votedParents;
  String? createdAt;
  String? updatedAt;
  int? version;

  Matches({
    this.teamA,
    this.teamB,
    this.id,
    this.date,
    this.startTime,
    this.endTime,
    this.stadium,
    this.manager,
    this.matchStatus,
    this.votingOpen,
    this.status,
    this.elapsedMs,
    this.stopwatchTime,
    this.handoverVoting,
    this.votedParents,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  Matches.fromJson(Map<String, dynamic> json) {
    teamA = json['teamA'] != null ? TeamA.fromJson(json['teamA']) : null;
    teamB = json['teamB'] != null ? TeamB.fromJson(json['teamB']) : null;

    id = json['_id'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    stadium = json['stadium'];

    manager =
    json['manager'] != null ? Manager.fromJson(json['manager']) : null;

    matchStatus = json['matchStatus'];
    votingOpen = json['votingOpen'];
    status = json['status'];
    elapsedMs = json['elapsedMs'];
    stopwatchTime = json['stopwatchTime'];

    handoverVoting = json['handoverVoeting'];
    votedParents = json['votedParents'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      'teamA': teamA?.toJson(),
      'teamB': teamB?.toJson(),
      '_id': id,
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'stadium': stadium,
      'manager': manager?.toJson(),
      'matchStatus': matchStatus,
      'votingOpen': votingOpen,
      'status': status,
      'elapsedMs': elapsedMs,
      'stopwatchTime': stopwatchTime,
      'handoverVoeting': handoverVoting,
      'votedParents': votedParents,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}

////////////////////////////////////////////////////////////

class TeamA {
  String? name;
  List<dynamic>? players;
  String? teamALogo;
  List<dynamic>? substitutions;
  List<dynamic>? goalScorers;
  List<dynamic>? goalAssists;
  int? totalGoals;

  TeamA({
    this.name,
    this.players,
    this.teamALogo,
    this.substitutions,
    this.goalScorers,
    this.goalAssists,
    this.totalGoals,
  });

  TeamA.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    players = json['players'];
    teamALogo = json['teamALogo'];
    substitutions = json['substitutions'];
    goalScorers = json['goalScorers'];
    goalAssists = json['goalAssists'];
    totalGoals = json['totalGoals'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'players': players,
      'teamALogo': teamALogo,
      'substitutions': substitutions,
      'goalScorers': goalScorers,
      'goalAssists': goalAssists,
      'totalGoals': totalGoals,
    };
  }
}

////////////////////////////////////////////////////////////

class TeamB {
  String? name;
  String? teamBLogo;
  int? totalGoals;

  TeamB({this.name, this.teamBLogo, this.totalGoals});

  TeamB.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    teamBLogo = json['teamBLogo'];
    totalGoals = json['totalGoals'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'teamBLogo': teamBLogo,
      'totalGoals': totalGoals,
    };
  }
}

////////////////////////////////////////////////////////////

class Manager {
  String? name;
  String? userId;
  String? id;

  Manager({this.name, this.userId, this.id});

  Manager.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId,
      '_id': id,
    };
  }
}
