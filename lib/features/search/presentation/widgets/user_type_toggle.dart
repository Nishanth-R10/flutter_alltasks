import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/search/application/search_user_provider.dart';

class UserTypeToggle extends ConsumerWidget {
  final double baseSize;
  const UserTypeToggle({super.key, required this.baseSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      padding: EdgeInsets.all(baseSize * 2),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],
        borderRadius: BorderRadius.circular(baseSize * 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("New User", style: _buildTextStyle(ref, UserType.newUser, isDark)),
          Switch(value: ref.watch(userTypeProvider) == UserType.returningUser, onChanged: (value) {
            ref.read(userTypeProvider.notifier).state = value ? UserType.returningUser : UserType.newUser;
          }),
          Text("Returning User", style: _buildTextStyle(ref, UserType.returningUser, isDark)),
        ],
      ),
    );
  }

  TextStyle _buildTextStyle(WidgetRef ref, UserType type, bool isDark) {
    return GoogleFonts.poppins(
      fontSize: baseSize * 3,
      color: ref.watch(userTypeProvider) == type ? Colors.blue : isDark ? Colors.grey.shade400 : Colors.grey,
      fontWeight: ref.watch(userTypeProvider) == type ? FontWeight.w600 : FontWeight.normal,
    );
  }
}