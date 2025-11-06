import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';

abstract class ReferralRepository {
  Future<Either<String, ReferralEntity>> getReferralDetails();
}