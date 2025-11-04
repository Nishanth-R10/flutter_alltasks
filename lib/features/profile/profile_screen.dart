// lib/features/profile/presentation/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/routes/app_route.gr.dart';
import 'package:tasks/features/profile/application/user_state.dart';
import 'package:tasks/features/profile/domain/entities/user_entity.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';
import 'package:tasks/features/profile/presentation/controller/app_providers.dart';
import 'package:tasks/features/profile/presentation/widgets/settings_card.dart';
import 'package:tasks/features/profile/presentation/widgets/group_card.dart';
import 'package:tasks/features/profile/presentation/widgets/big_card.dart';

part 'presentation/screens/profile_screen_content.dart';
part 'presentation/screens/profile_screen_parts.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}