// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:tasks/features/home/home_screen.dart' as _i1;
import 'package:tasks/features/profile/profile_screen.dart' as _i2;
import 'package:tasks/features/search/presentation/widgets/unified_searchscreen.dart'
    as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ProfileScreen]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute({List<_i4.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i3.UnifiedSearchScreen]
class UnifiedSearchRoute extends _i4.PageRouteInfo<void> {
  const UnifiedSearchRoute({List<_i4.PageRouteInfo>? children})
    : super(UnifiedSearchRoute.name, initialChildren: children);

  static const String name = 'UnifiedSearchRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.UnifiedSearchScreen();
    },
  );
}
