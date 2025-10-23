<<<<<<< HEAD
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tasks/core/routes/app_route.gr.dart';

class NavigationUtils {
  static void safePop(BuildContext context) {
    if (context.router.canPop()) { // Use context.router.canPop() instead of context.canPop()
      context.pop(); // Use context.pop() instead of context.popRoute()
    } else {
      // If no route to pop, navigate to home
      context.router.replace(const HomeRoute());
    }
  }

  static void navigateToHome(BuildContext context) {
    context.router.replace(const HomeRoute());
  }
=======
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tasks/core/routes/app_route.gr.dart';

class NavigationUtils {
  static void safePop(BuildContext context) {
    if (context.router.canPop()) { // Use context.router.canPop() instead of context.canPop()
      context.pop(); // Use context.pop() instead of context.popRoute()
    } else {
      // If no route to pop, navigate to home
      context.router.replace(const HomeRoute());
    }
  }

  static void navigateToHome(BuildContext context) {
    context.router.replace(const HomeRoute());
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}