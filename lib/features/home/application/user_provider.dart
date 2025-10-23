

// lib/core/providers/user_provider.dart
import 'package:flutter_riverpod/legacy.dart';

enum UserType {
  newUser,
  returningUser,
}

final userTypeProvider = StateProvider<UserType>((ref) => UserType.newUser);