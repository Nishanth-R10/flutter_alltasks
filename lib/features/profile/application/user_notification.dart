

import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/features/profile/data/repository/user_repository.dart';
import 'package:tasks/features/profile/domain/entities/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserRepository repository;
  
  UserNotifier(this.repository) : super(const UserInitial());

  Future<void> fetchUser() async {
    state = const UserLoading();
    
    try {
      final user = await repository.fetchUser();
      state = UserLoaded(user);
    } catch (e) {
      state = UserError(e.toString());
    }
  }
}