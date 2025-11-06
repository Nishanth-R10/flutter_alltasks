import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';

abstract class RewardsRepository {
  Future<Either<String, RewardsEntity>> getRewardsDetails();
}