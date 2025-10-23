<<<<<<< HEAD
// lib/features/home/domain/entities/referral_entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_entity.freezed.dart';
part 'referral_entity.g.dart';

@freezed
class ReferralEntity with _$ReferralEntity {
  const factory ReferralEntity({
    required String referralCode,
    required int rewardPoints,
    required double totalEarnings,
    required int friendsReferred,
  }) = _ReferralEntity;

  factory ReferralEntity.fromJson(Map<String, dynamic> json) =>
      _$ReferralEntityFromJson(json);
=======
class ReferralEntity {
  final String referralCode;
  final int rewardPoints;

  const ReferralEntity({
    required this.referralCode,
    required this.rewardPoints,
  });
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}