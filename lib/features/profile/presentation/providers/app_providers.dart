import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/network/api_service.dart';

import 'package:tasks/features/profile/data/data_source/profile_api_service.dart';
import 'package:tasks/features/profile/data/repositories/user_repository.dart';
import 'package:tasks/features/profile/data/repositories/user_repository_impl.dart';
import 'package:tasks/features/profile/presentation/controller/user_notifier.dart';
import 'package:tasks/features/profile/presentation/controller/user_state.dart';

// Core API Service Provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

// Profile API Service Provider
final profileApiServiceProvider = Provider<ProfileApiService>((ref) {
  return ProfileApiServiceImpl(ref.read(apiServiceProvider));
});

// Repository Provider
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(profileApiServiceProvider));
});

// Notifier Provider
final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.read(userRepositoryProvider));
});