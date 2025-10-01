import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/providers/search_provider.dart';
import 'newuser_searchscreen.dart';
import 'returninguser_searchscreen.dart';


@RoutePage()
class SearchScreen extends ConsumerWidget {
   SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the user type from provider
    final isReturningUser = ref.watch(isReturningUserProvider);
    
    return isReturningUser
        ?  ReturningUserSearchScreen()
        :  NewUserSearchScreen();
  }
}