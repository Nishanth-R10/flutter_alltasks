import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/features/profile/data/static_profile_data.dart';

// Remove the legacy import and use only flutter_riverpod
final profileLoadingProvider = StateProvider<bool>((ref) => true);

final staticUserDataProvider = Provider<Map<String, dynamic>>((ref) => StaticProfileData.userData);

final groupCardTitlesProvider = Provider<List<String>>((ref) => StaticProfileData.groupCardTitles);

final bigCardsDataProvider = Provider<List<Map<String, dynamic>>>((ref) => StaticProfileData.bigCardsData);