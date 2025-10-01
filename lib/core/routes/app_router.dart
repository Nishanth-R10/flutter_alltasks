// lib/core/routes/app_router.dart
import 'package:auto_route/auto_route.dart';
import 'package:tasks/features/home/presentation/home_screen.dart';
import 'package:tasks/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: NewUserSearchRoute.page),
        AutoRoute(page: ReturningUserSearchRoute.page),
      ];
}
