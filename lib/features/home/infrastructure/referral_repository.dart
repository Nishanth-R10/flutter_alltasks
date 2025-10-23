<<<<<<< HEAD
// lib/features/home/infrastructure/referral_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/core/network/dio_client.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';

class ReferralRepository {
  final ApiService _apiService;

  ReferralRepository(this._apiService);

  Future<Either<String, ReferralEntity>> getReferralDetails() async {
    try {
      print('🔄 Fetching referral details...');

      final result = await _apiService.get<Map<String, dynamic>>('/todos/1');

      return result.fold(
        (error) {
          print('⚠️ API error, using fallback referral');
          return Right(_getFallbackReferral());
        },
        (data) {
          print('✅ Using fallback referral data');
          return Right(_getFallbackReferral());
        },
      );
    } catch (e) {
      print('❌ Referral error, using fallback: $e');
      return Right(_getFallbackReferral());
    }
  }

  ReferralEntity _getFallbackReferral() {
    return ReferralEntity(
      referralCode: 'FRIEND2024',
      rewardPoints: 50,
      totalEarnings: 1250.0,
      friendsReferred: 8,
    );
  }
=======
import '../domain/entities/referral_entity.dart';

class ReferralRepository {
  ReferralEntity getReferralDetails() {
    return const ReferralEntity(
      referralCode: "FRIEND2024",
      rewardPoints: 50,
    );
  }
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}