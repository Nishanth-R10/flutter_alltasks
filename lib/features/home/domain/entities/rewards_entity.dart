// lib/features/home/domain/entities/rewards_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rewards_entity.freezed.dart';
part 'rewards_entity.g.dart';

@freezed
class RewardsEntity with _$RewardsEntity {
  const factory RewardsEntity({
    required int totalPoints,
    required int pointsEarned,
    required double progressPercentage,
    required double amountAway,
    required double nextRewardThreshold,
  }) = _RewardsEntity;

  factory RewardsEntity.fromJson(Map<String, dynamic> json) =>
      _$RewardsEntityFromJson(json);
}