// lib/features/search/data/repository/whats_new_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/search/domain/entities/whats_new_entity.dart';

abstract class WhatsNewRepository {
  Future<Either<String, List<WhatsNewEntity>>> getWhatsNewFeatures();
}