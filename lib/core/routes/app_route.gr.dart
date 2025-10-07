// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:tasks/features/home/presentation/home_screen.dart' as _i2;
import 'package:tasks/features/profile/presentation/profile_screen.dart' as _i4;
import 'package:tasks/features/search/presentation/pages/financial_service_screen.dart'
    as _i1;
import 'package:tasks/features/search/presentation/pages/newuser_searchscreen.dart'
    as _i3;
import 'package:tasks/features/search/presentation/pages/returninguser_searchscreen.dart'
    as _i5;
import 'package:tasks/features/search/presentation/pages/search_screen.dart'
    as _i6;

/// generated route for
/// [_i1.FinancialServicesScreen]
class FinancialServicesRoute extends _i7.PageRouteInfo<void> {
  const FinancialServicesRoute({List<_i7.PageRouteInfo>? children})
    : super(FinancialServicesRoute.name, initialChildren: children);

  static const String name = 'FinancialServicesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.FinancialServicesScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.NewUserSearchScreen]
class NewUserSearchRoute extends _i7.PageRouteInfo<void> {
  const NewUserSearchRoute({List<_i7.PageRouteInfo>? children})
    : super(NewUserSearchRoute.name, initialChildren: children);

  static const String name = 'NewUserSearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.NewUserSearchScreen();
    },
  );
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.ReturningUserSearchScreen]
class ReturningUserSearchRoute extends _i7.PageRouteInfo<void> {
  const ReturningUserSearchRoute({List<_i7.PageRouteInfo>? children})
    : super(ReturningUserSearchRoute.name, initialChildren: children);

  static const String name = 'ReturningUserSearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ReturningUserSearchScreen();
    },
  );
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i7.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return _i6.SearchScreen(key: args.key);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
