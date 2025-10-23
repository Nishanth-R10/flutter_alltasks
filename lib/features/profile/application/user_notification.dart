<<<<<<< HEAD
// lib/features/profile/application/user_notifier.dart
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/application/user_state.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(UserState.initial());

  Future<void> fetchUser() async {
    state = state.copyWith(isLoading: true, userResult: const None());
    
    final result = await _userRepository.fetchUser();
    
    state = state.copyWith(
      isLoading: false,
      userResult: Some(result),
    );
  }

  Future<void> updateUser(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    
    final result = await _userRepository.updateUser(user);
    
    state = state.copyWith(
      isLoading: false,
      userResult: Some(result),
    );
  }

  void clearError() {
    state = state.copyWith(userResult: const None());
  }
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';

class UserState {
  final bool isLoading;
  final Either<String, UserEntity>? userResult;

  const UserState({
    this.isLoading = false,
    this.userResult,
  });

  UserState copyWith({
    bool? isLoading,
    Either<String, UserEntity>? userResult,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      userResult: userResult ?? this.userResult,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(const UserState());

  Future<void> fetchUser() async {
    state = state.copyWith(isLoading: true);
    final result = await _userRepository.fetchUser();
    state = state.copyWith(isLoading: false, userResult: result);
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}