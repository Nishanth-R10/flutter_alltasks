import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';
import 'search_repository_provider.dart';

// Whats New Features Provider
final whatsNewFeaturesProvider = FutureProvider.autoDispose<List<WhatsNewEntity>>((ref) async {
  final repository = ref.read(searchRepositoryProvider);
  return await repository.getWhatsNewFeatures();
});