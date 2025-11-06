import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/data/datasource/home_local_data_source.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';

import '../../domain/repository/offer_repository.dart'; // CORRECT PATH

class OfferRepositoryImpl implements OfferRepository {
  final HomeLocalDataSource _localDataSource;

  OfferRepositoryImpl(this._localDataSource);

  @override
  Future<Either<String, List<OfferEntity>>> getOffers() async {
    return await _localDataSource.getOffers();
  }

  @override
  Future<Either<String, OfferEntity>> getOfferDetails(int id) async {
    return Left('Not implemented');
  }

  @override
  Future<Either<String, List<OfferEntity>>> getFlightOffers() async {
    return Left('Not implemented');
  }
}