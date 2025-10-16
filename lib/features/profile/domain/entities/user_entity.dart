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