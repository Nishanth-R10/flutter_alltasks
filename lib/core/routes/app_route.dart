import 'package:auto_route/auto_route.dart';
import 'package:tasks/core/routes/app_route.gr.dart';
import 'package:tasks/features/offers/presentation/widgets/custom_offer_dialog.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
<<<<<<< HEAD
       AutoRoute(page: HomeRoute.page, initial: true),
    //  AutoRoute(page: ProfileRoute.page),
        //AutoRoute(page: UnifiedSearchRoute.page), 
=======
        // AutoRoute(page: HomeRoute.page, initial: true),
        // AutoRoute(page: ProfileRoute.page),
        // AutoRoute(page: UnifiedSearchRoute.page), 
       // AutoRoute(page: CustomOfferDialogRoute.page,initial: true), 
>>>>>>> feature/offers
      
      ];
}