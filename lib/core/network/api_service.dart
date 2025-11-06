import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'api_service_base.dart';
import 'api_service_impl.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

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