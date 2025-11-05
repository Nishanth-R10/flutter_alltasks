import 'package:flutter_riverpod/legacy.dart';

// Search Query State
final searchQueryProvider = StateProvider<String>((ref) => '');

// TODO: UNCOMMENT WHEN ADDING RETURNING USER LATER
/*
enum UserType {
  newUser,
  returningUser,
}

final userTypeProvider = StateProvider<UserType>((ref) => UserType.newUser);
final returningUserSearchQueryProvider = StateProvider<String>((ref) => '');
*/