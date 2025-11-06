// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralEntityImpl _$$ReferralEntityImplFromJson(Map<String, dynamic> json) =>
    _$ReferralEntityImpl(
      referralCode: json['referralCode'] as String,
      rewardPoints: (json['rewardPoints'] as num).toInt(),
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      friendsReferred: (json['friendsReferred'] as num).toInt(),
    );

Map<String, dynamic> _$$ReferralEntityImplToJson(
  _$ReferralEntityImpl instance,
) => <String, dynamic>{
  'referralCode': instance.referralCode,
  'rewardPoints': instance.rewardPoints,
  'totalEarnings': instance.totalEarnings,
  'friendsReferred': instance.friendsReferred,
};
