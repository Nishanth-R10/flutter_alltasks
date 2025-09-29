import '../domain/referral_entity.dart';

class ReferralRepository {
  ReferralEntity getReferralDetails() {
    return const ReferralEntity(
      referralCode: "FRIEND2024",
      rewardPoints: 50,
    );
  }
}
