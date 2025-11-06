import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/data/datasource/home_local_data_source.dart';
import 'package:tasks/features/home/domain/entities/rewards_entity.dart';
import 'package:tasks/features/home/domain/repository/rewards_repository.dart';

class RewardsRepositoryImpl implements RewardsRepository {  // Correct class name
  final HomeLocalDataSource _localDataSource;

  RewardsRepositoryImpl(this._localDataSource);

  @override
  Future<Either<String, RewardsEntity>> getRewardsDetails() async {
    return await _localDataSource.getRewards();
  }
}