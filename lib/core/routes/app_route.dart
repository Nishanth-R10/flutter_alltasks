<<<<<<< HEAD
import 'package:auto_route/auto_route.dart';
import 'package:tasks/core/routes/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: UnifiedSearchRoute.page), 
      
      ];
=======
import 'package:auto_route/auto_route.dart';
import 'package:tasks/core/routes/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: UnifiedSearchRoute.page), // Only this search route
        // Removed: SearchRoute, FinancialServicesRoute, NewUserSearchRoute, ReturningUserSearchRoute
      ];
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}