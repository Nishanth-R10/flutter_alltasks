import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks/features/home/presentation/home_screen.dart';

//import 'package:tasks/features/home/presentation/home_screen.dart';
import 'package:tasks/features/profile/presentation/profile_screen.dart';
import 'package:tasks/features/search/presentation/pages/search_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp())); // Remove 'const' before MyApp()
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       ScreenUtilInit(  designSize: const Size(393, 852),
      builder: (_, __) =>
          MaterialApp(debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        //  home: const SearchScreen(isReturningUser: true),
         // home: ProfileScreen(),
           home:HomeScreen() ,
               ),
       );
    
  }
}