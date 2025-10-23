<<<<<<< HEAD
// lib/core/network/api_service.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'api_service_base.dart';
import 'api_service_impl.dart';

//provider -
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

// Main class extends the base
class ApiService extends ApiServiceBase {
  final ApiServiceImpl _impl;

  ApiService() : _impl = ApiServiceImpl();

  @override
  Future<Either<String, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) {
    return _impl.get(
      path,
      queryParameters: queryParameters,
      fromJson: fromJson,
      useFallback: useFallback,
    );
  }

  @override
  Future<Either<String, T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) {
    return _impl.post(
      path,
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
      useFallback: useFallback,
    );
  }

  @override
  Future<Either<String, T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) {
    return _impl.put(
      path,
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
      useFallback: useFallback,
    );
  }

  @override
  Future<Either<String, T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) {
    return _impl.delete(
      path,
      queryParameters: queryParameters,
      fromJson: fromJson,
      useFallback: useFallback,
    );
  }
}
=======
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConstants.baseUrl, // Set default base URL
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
        )) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Overloaded GET method - with just path (uses default baseUrl from Dio)
  Future<Either<String, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    return _performGet<T>(
      ApiConstants.baseUrl,
      path,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  // Original GET method - with custom baseUrl and path
  Future<Either<String, T>> getWithBaseUrl<T>(
    String baseUrl,
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    return _performGet<T>(
      baseUrl,
      path,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  // Private method that does the actual work
  Future<Either<String, T>> _performGet<T>(
    String baseUrl,
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        '$baseUrl$path',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        if (fromJson != null && data is Map<String, dynamic>) {
          return Right(fromJson(data));
        } else if (data is List && fromJson != null) {
          final List<dynamic> dataList = data;
          final result = dataList
              .map((item) => fromJson(item as Map<String, dynamic>))
              .toList();
          return Right(result as T);
        } else if (data is T) {
          return Right(data);
        } else {
          return Left('Invalid response format');
        }
      } else {
        return Left('HTTP ${response.statusCode}: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      return Left('Dio Error: ${e.message}');
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }
}

// Global Provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
