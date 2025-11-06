import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/data/datasource/home_local_data_source.dart';
import 'package:tasks/features/home/domain/entities/referral_entity.dart';

import '../../domain/repository/referral_repository.dart'; // CORRECT PATH

class ReferralRepositoryImpl implements ReferralRepository {
  final HomeLocalDataSource _localDataSource;

  ReferralRepositoryImpl(this._localDataSource);

  @override
  Future<Either<String, ReferralEntity>> getReferralDetails() async {
    return await _localDataSource.getReferrals();
  }
}