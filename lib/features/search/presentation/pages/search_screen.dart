// File: lib/features/search/presentation/pages/search_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'newuser_searchscreen.dart';
import 'returninguser_searchscreen.dart';

class SearchScreen extends ConsumerWidget {
  final bool isReturningUser;

  const SearchScreen({
    super.key,
    required this.isReturningUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isReturningUser
        ? const ReturningUserSearchScreen()
        : const NewUserSearchScreen();
  }
}