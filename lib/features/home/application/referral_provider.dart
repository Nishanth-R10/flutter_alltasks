import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/referral_entity.dart';
import '../infrastructure/referral_repository.dart';

final referralProvider = Provider<ReferralEntity>((ref) {
  return ReferralRepository().getReferralDetails();
});
