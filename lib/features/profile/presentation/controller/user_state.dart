import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required bool isLoading,
    required Option<Either<String, UserEntity>> userResult,
  }) = _UserState;

  factory UserState.initial() => const UserState(
        isLoading: false,
        userResult: None(),
      );
}