import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> fetchUser();
  Future<Either<String, UserEntity>> updateUser(UserEntity user);
}