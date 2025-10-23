<<<<<<< HEAD
// lib/features/search/presentation/widgets/unified_search/user_type_toggle.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/home/application/user_provider.dart';

class UserTypeToggle extends ConsumerWidget {
  final double baseSize;

  const UserTypeToggle({
    super.key,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(baseSize * 2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(baseSize * 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "New User",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3,
              color: ref.watch(userTypeProvider) == UserType.newUser 
                  ? Colors.blue 
                  : Colors.grey,
              fontWeight: ref.watch(userTypeProvider) == UserType.newUser 
                  ? FontWeight.w600 
                  : FontWeight.normal,
            ),
          ),
          Switch(
            value: ref.watch(userTypeProvider) == UserType.returningUser,
            onChanged: (value) {
              ref.read(userTypeProvider.notifier).state = 
                  value ? UserType.returningUser : UserType.newUser;
            },
          ),
          Text(
            "Returning User",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3,
              color: ref.watch(userTypeProvider) == UserType.returningUser 
                  ? Colors.blue 
                  : Colors.grey,
              fontWeight: ref.watch(userTypeProvider) == UserType.returningUser 
                  ? FontWeight.w600 
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
=======
// lib/features/search/presentation/widgets/unified_search/user_type_toggle.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/home/application/user_provider.dart';

class UserTypeToggle extends ConsumerWidget {
  final double baseSize;

  const UserTypeToggle({
    super.key,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(baseSize * 2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(baseSize * 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "New User",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3,
              color: ref.watch(userTypeProvider) == UserType.newUser 
                  ? Colors.blue 
                  : Colors.grey,
              fontWeight: ref.watch(userTypeProvider) == UserType.newUser 
                  ? FontWeight.w600 
                  : FontWeight.normal,
            ),
          ),
          Switch(
            value: ref.watch(userTypeProvider) == UserType.returningUser,
            onChanged: (value) {
              ref.read(userTypeProvider.notifier).state = 
                  value ? UserType.returningUser : UserType.newUser;
            },
          ),
          Text(
            "Returning User",
            style: GoogleFonts.poppins(
              fontSize: baseSize * 3,
              color: ref.watch(userTypeProvider) == UserType.returningUser 
                  ? Colors.blue 
                  : Colors.grey,
              fontWeight: ref.watch(userTypeProvider) == UserType.returningUser 
                  ? FontWeight.w600 
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}