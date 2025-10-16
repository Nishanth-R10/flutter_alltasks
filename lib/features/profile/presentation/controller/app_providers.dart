
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:tasks/features/profile/application/user_notification.dart';
// import 'package:tasks/features/profile/data/repository/user_repository.dart';
// import 'package:tasks/features/profile/domain/entities/user_state.dart';

// final userRepositoryProvider = Provider<UserRepository>((ref) {
//   return UserRepository();
// });

// final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
//   return UserNotifier(ref.read(userRepositoryProvider));
// });
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/profile/application/user_notification.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/data/repository/user_repository_impl.dart';

// API Service Provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

// Repository Provider
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(apiServiceProvider));
});

// Notifier Provider
final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.read(userRepositoryProvider));
});