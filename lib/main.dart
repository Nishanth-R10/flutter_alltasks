// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/widgets/app_theme.dart';
import 'package:tasks/core/routes/app_route.dart';
import 'package:tasks/core/providers/theme_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  final _appRouter = AppRouter();
  
  MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    //  rebuild when system theme changes
    ref.invalidate(themeProvider);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    
    print('Current theme brightness: ${theme.brightness}'); 
    
    return MaterialApp.router(
      title: 'Tasks App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), 
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, 
      routerConfig: widget._appRouter.config(),
    );
  }
}