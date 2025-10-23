// lib/core/network/api_service_impl.dart
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'api_constants.dart';

class ApiServiceImpl {
  final Dio _dio;

  ApiServiceImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: ApiConstants.connectTimeout,
          receiveTimeout: ApiConstants.receiveTimeout,
          validateStatus: (status) => true,
        )) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
  }

  // GET
  Future<Either<String, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) async {
    return _performRequest('GET', path,
        queryParameters: queryParameters,
        fromJson: fromJson,
        useFallback: useFallback);
  }

  // POST
  Future<Either<String, T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) async {
    return _performRequest('POST', path,
        data: data,
        queryParameters: queryParameters,
        fromJson: fromJson,
        useFallback: useFallback);
  }

  // PUT
  Future<Either<String, T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) async {
    return _performRequest('PUT', path,
        data: data,
        queryParameters: queryParameters,
        fromJson: fromJson,
        useFallback: useFallback);
  }

  // DELETE
  Future<Either<String, T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) async {
    return _performRequest('DELETE', path,
        queryParameters: queryParameters,
        fromJson: fromJson,
        useFallback: useFallback);
  }

  // Main request handler
  Future<Either<String, T>> _performRequest<T>(
    String method,
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
    bool useFallback = false,
  }) async {
    try {
      print(' $method: $path');
      
      final response = await _makeDioCall(method, path, data, queryParameters);
      
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(' $method successful');
        return _handleResponseData(response.data, fromJson);
      } else {
        return _handleError(method, response.statusCode, path, useFallback);
      }
    } on DioException catch (e) {
      return _handleDioError(method, e, path, useFallback);
    } catch (e) {
      return _handleUnexpectedError(method, e, path, useFallback);
    }
  }

  // Dio call
  Future<Response<dynamic>> _makeDioCall(
    String method,
    String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  ) {
    switch (method) {
      case 'GET':
        return _dio.get(path, queryParameters: queryParameters);
      case 'POST':
        return _dio.post(path, data: data, queryParameters: queryParameters);
      case 'PUT':
        return _dio.put(path, data: data, queryParameters: queryParameters);
      case 'DELETE':
        return _dio.delete(path, queryParameters: queryParameters);
      default:
        throw 'Unsupported method: $method';
    }
  }

  // Response handling
  Either<String, T> _handleResponseData<T>(
    dynamic responseData,
    T Function(Map<String, dynamic>)? fromJson,
  ) {
    try {
      if (fromJson != null && responseData is Map<String, dynamic>) {
        return Right(fromJson(responseData));
      } else if (responseData is T) {
        return Right(responseData);
      }
      return Left('Invalid response format');
    } catch (e) {
      return Left('Parse error: $e');
    }
  }

  // Error handlers
  Either<String, T> _handleError<T>(
    String method, int? statusCode, String path, bool useFallback) {
    print(' $method failed: $statusCode');
    return useFallback 
        ? Right(_getFallbackData<T>(path))
        : Left('HTTP $statusCode');
  }

  Either<String, T> _handleDioError<T>(
    String method, DioException e, String path, bool useFallback) {
    print(' $method Dio error: ${e.message}');
    return useFallback 
        ? Right(_getFallbackData<T>(path))
        : Left('Network error: ${e.message}');
  }

  Either<String, T> _handleUnexpectedError<T>(
    String method, dynamic e, String path, bool useFallback) {
    print(' $method unexpected error: $e');
    return useFallback 
        ? Right(_getFallbackData<T>(path))
        : Left('Unexpected error: $e');
  }

  // Fallback data
  T _getFallbackData<T>(String path) {
    print(' Using fallback for: $path');
    switch (path) {
      case '/users/1':
        return {
          "id": 1,
          "name": "Local User",
          "email": "user@example.com"
        } as T;
      case '/posts':
        return [{"id": 1, "title": "Local Post"}] as T;
      default:
        return {"status": "fallback"} as T;
    }
  }
}