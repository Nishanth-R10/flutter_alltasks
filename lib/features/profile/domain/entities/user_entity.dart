<<<<<<< HEAD
// lib/features/profile/domain/entities/user_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String name,
    required String email,
    required String location,
    required String id,
    String? phone,
    String? joinDate,
    String? profileImage,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
=======
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String location;
  final String id;

  const UserEntity({
    required this.name,
    required this.email,
    required this.location,
    required this.id,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [name, email, location, id];
}
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
