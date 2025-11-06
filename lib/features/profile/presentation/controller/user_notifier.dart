import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';
import 'package:tasks/features/profile/presentation/controller/user_state.dart';

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
}