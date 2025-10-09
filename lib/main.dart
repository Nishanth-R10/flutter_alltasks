import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/routes/app_route.dart';

void main() {
  runApp(
    ProviderScope(
      child: i18nBinder(
        child: MyApp(),
      ),
    ),
  );
}

class i18nBinder extends StatelessWidget {
  final Widget child;
  
  const i18nBinder({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false,
      title: 'Tasks App',
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return child!;
      },
    );
  }
}