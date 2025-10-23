<<<<<<< HEAD
// lib/features/profile/data/repository/user_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<Either<String, UserEntity>> fetchUser() async {
    try {
      print('🔄 Fetching user from API...');

      final result = await _apiService.get<Map<String, dynamic>>('/users/1');

      return result.fold(
        (error) {
          print('⚠️ API error, using fallback user');
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
      print('🔄 Updating user via API...');
      
      // ✅ FIXED: Using correct put method with named parameter
      final result = await _apiService.put<Map<String, dynamic>>(
        '/users/1',
        data: _userToJson(user), // Convert to proper JSON
      );
      
      return result.fold(
        (error) {
          print('⚠️ Update API error, returning original user');
          return Right(user); // Return the original user as fallback
        },
        (data) {
          print('✅ User update successful (simulated)');
          // For now, just return the original user since API is blocked
          return Right(user);
        },
      );
    } catch (e) {
      print('❌ User update error: $e');
      return Right(user); // Return original user as fallback
    }
  }

  // Helper method to convert UserEntity to JSON
  Map<String, dynamic> _userToJson(UserEntity user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'location': user.location,
      // 'phone': user.phone, // Uncomment if phone field exists
    };
  }

  // Fallback user data
  UserEntity _getFallbackUser() {
    return UserEntity(
      id: '00052321',
      name: 'Alqabiadi',
      email: 'aliahmed@example.com',
      location: 'Alabama',
      // phone: '+1 234 567 8900', // Uncomment if phone field exists
    );
  }
}
=======
import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';
  
class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<Either<String, UserEntity>> fetchUser() async {
    try {
      print('🔄 Fetching user from API...');
      
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 2));
      
      // DUMMY API RESPONSE (structured like real API)
      final dummyApiResponse = {
        "status": "success",
        "message": "User data retrieved successfully",
        "data": {
          "user": {
            "id": "00052321",
            "name": "Alqabiadi",
            "email": "aliahmed@example.com",
            "location": "alabama",
            "phone": "+1 234 567 8900",
            "joinDate": "2023-01-15"
          }
        }
      };
      
      // Parse the DUMMY API response like real API
      final user = _parseApiResponse(dummyApiResponse);
      print(' Dummy API Success: User data loaded');
      return Right(user);
      
    } catch (e) {
      print(' Dummy API Error: $e');
      return Left('API Error: $e');
    }
  }

  UserEntity _parseApiResponse(Map<String, dynamic> apiResponse) {
    try {
      // Parse like real API response structure
      final Map<String, dynamic> userData = apiResponse['data']['user'];
      
      return UserEntity.fromJson(userData);
    } catch (e) {
      print(' Parsing error: $e');
      throw Exception('Failed to parse API response: $e');
    }
  }

  @override
  Future<Either<String, UserEntity>> updateUser(UserEntity user) async {
    try {
      // Simulate API update with dummy response
      await Future.delayed(const Duration(seconds: 1));
      
      // DUMMY API RESPONSE for update
      final dummyApiResponse = {
        "status": "success", 
        "message": "User updated successfully",
        "data": {
          "user": user.toJson()
        }
      };
      
      // Parse the response
      final updatedUser = _parseApiResponse(dummyApiResponse);
      return Right(updatedUser);
      
    } catch (e) {
      return Left('Update Error: $e');
    }
  }

}
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
