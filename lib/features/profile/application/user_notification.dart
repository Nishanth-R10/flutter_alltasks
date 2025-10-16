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
}