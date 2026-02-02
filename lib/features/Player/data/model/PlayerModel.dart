class PlayerModel {
  List<Players>? players;

  PlayerModel({this.players});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  String? sId;
  String? name;
  String? parentEmail;
  String? username;
  String? parentPhone;
  String? position;
  int? jerseyNumber;
  String? parentName;
  String? birthDate;
  int? rating;
  int? reliability;
  String? avatar;
  bool? blacklist;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? parentId;

  Players(
      {this.sId,
        this.name,
        this.parentEmail,
        this.username,
        this.parentPhone,
        this.position,
        this.jerseyNumber,
        this.parentName,
        this.birthDate,
        this.rating,
        this.reliability,
        this.avatar,
        this.blacklist,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.parentId});

  Players.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    parentEmail = json['parent_email'];
    username = json['username'];
    parentPhone = json['parent_phone'];
    position = json['position'];
    jerseyNumber = json['jersey_number'];
    parentName = json['parent_name'];
    birthDate = json['birth_date'];
    rating = json['rating'];
    reliability = json['reliability'];
    avatar = json['avatar'];
    blacklist = json['blacklist'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['parent_email'] = this.parentEmail;
    data['username'] = this.username;
    data['parent_phone'] = this.parentPhone;
    data['position'] = this.position;
    data['jersey_number'] = this.jerseyNumber;
    data['parent_name'] = this.parentName;
    data['birth_date'] = this.birthDate;
    data['rating'] = this.rating;
    data['reliability'] = this.reliability;
    data['avatar'] = this.avatar;
    data['blacklist'] = this.blacklist;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['parent_id'] = this.parentId;
    return data;
  }
}
