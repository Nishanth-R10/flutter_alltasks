import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';

abstract class OfferRepository {
  Future<Either<String, List<OfferEntity>>> getOffers();
  Future<Either<String, Map<String, dynamic>>> getOfferDetails(int offerId);
}