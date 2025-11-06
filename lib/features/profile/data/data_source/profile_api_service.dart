import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_service_base.dart';

abstract class ProfileApiService {
  Future<Either<String, Map<String, dynamic>>> getUser(String userId);
  Future<Either<String, Map<String, dynamic>>> updateUser(
    String userId, 
    Map<String, dynamic> userData
  );
}

class ProfileApiServiceImpl implements ProfileApiService {
  final ApiServiceBase _apiService;

  ProfileApiServiceImpl(this._apiService);

  @override
  Future<Either<String, Map<String, dynamic>>> getUser(String userId) async {
    return _apiService.get<Map<String, dynamic>>('/users/$userId');
  }

  @override
  Future<Either<String, Map<String, dynamic>>> updateUser(
    String userId, 
    Map<String, dynamic> userData
  ) async {
    return _apiService.put<Map<String, dynamic>>(
      '/users/$userId',
      data: userData,
    );
  }
}