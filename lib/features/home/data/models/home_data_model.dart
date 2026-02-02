class HomeDashBoardModel {
  int? totalPlayer;
  int? totalRegisterPlayer;
  int? totalMatch;
  int? totalParents;
  int? totalRegisterParents;

  HomeDashBoardModel(
      {this.totalPlayer,
        this.totalRegisterPlayer,
        this.totalMatch,
        this.totalParents,
        this.totalRegisterParents});

  HomeDashBoardModel.fromJson(Map<String, dynamic> json) {
    totalPlayer = json['totalPlayer'];
    totalRegisterPlayer = json['totalRegisterPlayer'];
    totalMatch = json['totalMatch'];
    totalParents = json['totalParents'];
    totalRegisterParents = json['totalRegisterParents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPlayer'] = this.totalPlayer;
    data['totalRegisterPlayer'] = this.totalRegisterPlayer;
    data['totalMatch'] = this.totalMatch;
    data['totalParents'] = this.totalParents;
    data['totalRegisterParents'] = this.totalRegisterParents;
    return data;
  }
}
