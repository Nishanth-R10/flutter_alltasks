// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [NewUserSearchScreen]
class NewUserSearchRoute extends PageRouteInfo<void> {
  const NewUserSearchRoute({List<PageRouteInfo>? children})
    : super(NewUserSearchRoute.name, initialChildren: children);

  static const String name = 'NewUserSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewUserSearchScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [ReturningUserSearchScreen]
class ReturningUserSearchRoute
    extends PageRouteInfo<ReturningUserSearchRouteArgs> {
  ReturningUserSearchRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        ReturningUserSearchRoute.name,
        args: ReturningUserSearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ReturningUserSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReturningUserSearchRouteArgs>(
        orElse: () => const ReturningUserSearchRouteArgs(),
      );
      return ReturningUserSearchScreen(key: args.key);
    },
  );
}

class ReturningUserSearchRouteArgs {
  const ReturningUserSearchRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ReturningUserSearchRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReturningUserSearchRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return SearchScreen();
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final Key? key;

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
