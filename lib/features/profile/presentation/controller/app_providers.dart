// lib/features/profile/presentation/controller/app_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/features/profile/application/user_notification.dart';
import 'package:tasks/features/profile/application/user_state.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/data/repository/user_repository_impl.dart';

// Dio Client Provider
final api = Provider<ApiService>((ref) {
  return ApiService();
});

// Repository Provider
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(api));
});

// Notifier Provider
final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.read(userRepositoryProvider));
});