<<<<<<< HEAD
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/offers/domain/entities/offer_entity.dart';

abstract class OfferRepository {
  Future<Either<String, List<OfferEntity>>> getOffers();

  Future getOfferDetails(int id) async {}

  Future getFlightOffers() async {} // Add Future and Either
=======
import 'package:fpdart/fpdart.dart';
import 'package:tasks/features/home/domain/entities/offer_entity.dart';

abstract class OfferRepository {
  Future<Either<String, List<OfferEntity>>> getOffers();

  Future getOfferDetails(int id) async {}

  Future getFlightOffers() async {} // Add Future and Either
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}