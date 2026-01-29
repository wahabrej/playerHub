// domain/entity/user_entity.dart
class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final bool active;
  final String? avatar;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? token;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
    this.token,
  });
}
