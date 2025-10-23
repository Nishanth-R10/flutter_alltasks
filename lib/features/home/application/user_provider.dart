<<<<<<< HEAD
// lib/core/providers/user_provider.dart
import 'package:flutter_riverpod/legacy.dart';

enum UserType {
  newUser,
  returningUser,
}

=======
// lib/core/providers/user_provider.dart
import 'package:flutter_riverpod/legacy.dart';

enum UserType {
  newUser,
  returningUser,
}

>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
final userTypeProvider = StateProvider<UserType>((ref) => UserType.newUser);