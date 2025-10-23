// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardsEntityImpl _$$RewardsEntityImplFromJson(Map<String, dynamic> json) =>
    _$RewardsEntityImpl(
      totalPoints: (json['totalPoints'] as num).toInt(),
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
      amountAway: (json['amountAway'] as num).toDouble(),
      nextRewardThreshold: (json['nextRewardThreshold'] as num).toDouble(),
    );

Map<String, dynamic> _$$RewardsEntityImplToJson(_$RewardsEntityImpl instance) =>
    <String, dynamic>{
      'totalPoints': instance.totalPoints,
      'pointsEarned': instance.pointsEarned,
      'progressPercentage': instance.progressPercentage,
      'amountAway': instance.amountAway,
      'nextRewardThreshold': instance.nextRewardThreshold,
    };
