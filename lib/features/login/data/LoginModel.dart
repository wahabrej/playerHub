// data/model/login_model.dart
class LoginModel {
  final String message;
  final UserModel user;
  final String token;

  LoginModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] ?? '',
      user: UserModel.fromJson(json['user']),
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user.toJson(),
      'token': token,
    };
  }
}

// -------------------------
// data/model/user_model.dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final List<dynamic> childlist;
  final String? address;
  final String? apparment;
  final String? city;
  final String? state;
  final String? zip;
  final String? bio;
  final bool isVerified;
  final String? resetPasswordToken;
  final String? resetPasswordExpires;
  final String role;
  final int rating;
  final int reliability;
  final int totalJob;
  final bool topbadge;
  final String? avatar;
  final bool blacklist;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? birthDate;
  final String? firstName;
  final String? lastName;

  // Optional: token can be stored here too
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.childlist,
    this.address,
    this.apparment,
    this.city,
    this.state,
    this.zip,
    this.bio,
    required this.isVerified,
    this.resetPasswordToken,
    this.resetPasswordExpires,
    required this.role,
    required this.rating,
    required this.reliability,
    required this.totalJob,
    required this.topbadge,
    this.avatar,
    required this.blacklist,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, [String? token]) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      childlist: json['childlist'] ?? [],
      address: json['address'],
      apparment: json['Apparment'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      bio: json['bio'],
      isVerified: json['isVerified'] ?? false,
      resetPasswordToken: json['resetPasswordToken'],
      resetPasswordExpires: json['resetPasswordExpires'],
      role: json['role'] ?? '',
      rating: json['rating'] ?? 0,
      reliability: json['reliability'] ?? 0,
      totalJob: json['total_job'] ?? 0,
      topbadge: json['topbadge'] ?? false,
      avatar: json['avatar'],
      blacklist: json['blacklist'] ?? false,
      active: json['active'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()),
      birthDate: json['birth_date'] != null ? DateTime.parse(json['birth_date']) : null,
      firstName: json['first_name'],
      lastName: json['last_name'],
      token: token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'childlist': childlist,
      'address': address,
      'Apparment': apparment,
      'city': city,
      'state': state,
      'zip': zip,
      'bio': bio,
      'isVerified': isVerified,
      'resetPasswordToken': resetPasswordToken,
      'resetPasswordExpires': resetPasswordExpires,
      'role': role,
      'rating': rating,
      'reliability': reliability,
      'total_job': totalJob,
      'topbadge': topbadge,
      'avatar': avatar,
      'blacklist': blacklist,
      'active': active,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'birth_date': birthDate?.toIso8601String(),
      'first_name': firstName,
      'last_name': lastName,
      'token': token,
    };
  }
}
