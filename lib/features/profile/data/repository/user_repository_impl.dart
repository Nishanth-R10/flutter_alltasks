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
      print('✅ Dummy API Success: User data loaded');
      return Right(user);
      
    } catch (e) {
      print('❌ Dummy API Error: $e');
      return Left('API Error: $e');
    }
  }

  UserEntity _parseApiResponse(Map<String, dynamic> apiResponse) {
    try {
      // Parse like real API response structure
      final Map<String, dynamic> userData = apiResponse['data']['user'];
      
      return UserEntity.fromJson(userData);
    } catch (e) {
      print('❌ Parsing error: $e');
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