// lib/features/home/presentation/pages/home_screen.dart
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/routes/app_route.gr.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/presentation/widgets/customize_dashboard_card.dart';
import 'package:tasks/features/home/presentation/widgets/feedback_cards.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section.dart';
import 'package:tasks/features/home/presentation/widgets/quick_action.dart';
import 'package:tasks/features/home/presentation/widgets/refer_earn_card.dart';
import 'package:tasks/features/home/presentation/widgets/rewards_section.dart';
import 'package:tasks/features/home/presentation/widgets/wealth_advisory_section.dart';

import 'package:tasks/features/offers/application/offer_service.dart';

part 'home_screen_content.dart';
//part 'presentation/pages/home_screen_parts.dart';
//part 'presentation/pages/home_screen_api_section.dart';
part 'home_screen_navigation.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => HomeScreenState();
}