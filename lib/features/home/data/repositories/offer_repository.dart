import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/offers/domain/entities/offer_entity.dart';

abstract class OfferRepository {
  Future<Either<String, List<OfferEntity>>> getOffers();

  Future getOfferDetails(int id) async {}

  Future getFlightOffers() async {} // Add Future and Either
}