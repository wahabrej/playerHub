class HomeMathModel {
  TeamA? teamA;
  TeamB? teamB;
  String? sId;
  String? date;
  String? startTime;
  String? endTime;
  String? stadium;
  Manager? manager;
  String? matchStatus;
  dynamic manOfTheMatch;
  dynamic managerPalyerOfTheMatch;
  dynamic playerPlayerOfTheMatch;
  bool? votingOpen;
  String? status;
  dynamic startedAt;
  int? elapsedMs;
  String? stopwatchTime;
  List<dynamic>? handoverVoeting;
  List<dynamic>? votedParents;
  String? createdAt;
  String? updatedAt;
  int? iV;

  HomeMathModel(
      {this.teamA,
        this.teamB,
        this.sId,
        this.date,
        this.startTime,
        this.endTime,
        this.stadium,
        this.manager,
        this.matchStatus,
        this.manOfTheMatch,
        this.managerPalyerOfTheMatch,
        this.playerPlayerOfTheMatch,
        this.votingOpen,
        this.status,
        this.startedAt,
        this.elapsedMs,
        this.stopwatchTime,
        this.handoverVoeting,
        this.votedParents,
        this.createdAt,
        this.updatedAt,
        this.iV});

  HomeMathModel.fromJson(Map<String, dynamic> json) {
    teamA = json['teamA'] != null ? TeamA.fromJson(json['teamA']) : null;
    teamB = json['teamB'] != null ? TeamB.fromJson(json['teamB']) : null;
    sId = json['_id'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    stadium = json['stadium'];
    manager =
    json['manager'] != null ? Manager.fromJson(json['manager']) : null;
    matchStatus = json['matchStatus'];
    manOfTheMatch = json['manOfTheMatch'];
    managerPalyerOfTheMatch = json['managerPalyerOfTheMatch'];
    playerPlayerOfTheMatch = json['playerPlayerOfTheMatch'];
    votingOpen = json['votingOpen'];
    status = json['status'];
    startedAt = json['startedAt'];
    elapsedMs = json['elapsedMs'];
    stopwatchTime = json['stopwatchTime'];
    handoverVoeting =
    json['handoverVoeting'] != null ? List<dynamic>.from(json['handoverVoeting']) : null;
    votedParents =
    json['votedParents'] != null ? List<dynamic>.from(json['votedParents']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (teamA != null) data['teamA'] = teamA!.toJson();
    if (teamB != null) data['teamB'] = teamB!.toJson();
    data['_id'] = sId;
    data['date'] = date;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['stadium'] = stadium;
    if (manager != null) data['manager'] = manager!.toJson();
    data['matchStatus'] = matchStatus;
    data['manOfTheMatch'] = manOfTheMatch;
    data['managerPalyerOfTheMatch'] = managerPalyerOfTheMatch;
    data['playerPlayerOfTheMatch'] = playerPlayerOfTheMatch;
    data['votingOpen'] = votingOpen;
    data['status'] = status;
    data['startedAt'] = startedAt;
    data['elapsedMs'] = elapsedMs;
    data['stopwatchTime'] = stopwatchTime;
    if (handoverVoeting != null) data['handoverVoeting'] = handoverVoeting;
    if (votedParents != null) data['votedParents'] = votedParents;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class TeamA {
  String? name;
  List<dynamic>? players;
  String? teamALogo;
  List<dynamic>? substitutions;
  List<dynamic>? goalScorers;
  List<dynamic>? goalAssists;
  int? totalGoals;

  TeamA(
      {this.name,
        this.players,
        this.teamALogo,
        this.substitutions,
        this.goalScorers,
        this.goalAssists,
        this.totalGoals});

  TeamA.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    players = json['players'] != null ? List<dynamic>.from(json['players']) : null;
    teamALogo = json['teamALogo'];
    substitutions =
    json['substitutions'] != null ? List<dynamic>.from(json['substitutions']) : null;
    goalScorers =
    json['goalScorers'] != null ? List<dynamic>.from(json['goalScorers']) : null;
    goalAssists =
    json['goalAssists'] != null ? List<dynamic>.from(json['goalAssists']) : null;
    totalGoals = json['totalGoals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (players != null) data['players'] = players;
    data['teamALogo'] = teamALogo;
    if (substitutions != null) data['substitutions'] = substitutions;
    if (goalScorers != null) data['goalScorers'] = goalScorers;
    if (goalAssists != null) data['goalAssists'] = goalAssists;
    data['totalGoals'] = totalGoals;
    return data;
  }
}

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
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['teamBLogo'] = teamBLogo;
    data['totalGoals'] = totalGoals;
    return data;
  }
}

class Manager {
  String? name;
  String? userId;
  String? sId;

  Manager({this.name, this.userId, this.sId});

  Manager.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['userId'] = userId;
    data['_id'] = sId;
    return data;
  }
}
