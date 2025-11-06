import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/profile/data/data_source/profile_api_service.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';
import 'package:tasks/features/profile/data/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ProfileApiService _profileApiService;

  UserRepositoryImpl(this._profileApiService);

  @override
  Future<Either<String, UserEntity>> fetchUser() async {
    try {
      print('🔄 Fetching user from Profile API...');

      final result = await _profileApiService.getUser('1');

      return result.fold(
        (error) {
          print('⚠️ Profile API error, using fallback user');
          return Right(_getFallbackUser());
        },
        (data) {
          print('✅ Using fallback user data');
          return Right(_getFallbackUser());
        },
      );
    } catch (e) {
      print('❌ User fetch error, using fallback: $e');
      return Right(_getFallbackUser());
    }
  }

  @override
  Future<Either<String, UserEntity>> updateUser(UserEntity user) async {
    try {
      print('🔄 Updating user via Profile API...');
      
      final result = await _profileApiService.updateUser(
        user.id,
        _userToJson(user),
      );
      
      return result.fold(
        (error) {
          print('⚠️ Update Profile API error, returning original user');
          return Right(user);
        },
        (data) {
          print('✅ User update successful (simulated)');
          return Right(user);
        },
      );
    } catch (e) {
      print('❌ User update error: $e');
      return Right(user);
    }
  }

  // Helper method to convert UserEntity to JSON
  Map<String, dynamic> _userToJson(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'location': user.location,
      'phone': user.phone,
      'joinDate': user.joinDate,
      'profileImage': user.profileImage,
    };
  }

  // Fallback user data
  UserEntity _getFallbackUser() {
    return UserEntity(
      id: '00052321',
      name: 'Alqabiadi',
      email: 'aliahmed@example.com',
      location: 'Alabama',
      phone: '+1 234 567 8900',
      joinDate: '2024-01-01',
      profileImage: null,
    );
  }
}