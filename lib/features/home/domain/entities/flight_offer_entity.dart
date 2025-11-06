// // lib/features/home/domain/entities/flight_offer_entity.dart
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'flight_offer_entity.freezed.dart';
// part 'flight_offer_entity.g.dart';

// @freezed
// class FlightOfferEntity with _$FlightOfferEntity {
//   const factory FlightOfferEntity({
//     required String id,
//     required String title,
//     required String description,
//     required String imageUrl,
//     required String offerType,
//     required String iconAsset,
//     required String discountText,
//   }) = _FlightOfferEntity;

//   factory FlightOfferEntity.fromJson(Map<String, dynamic> json) =>
//       _$FlightOfferEntityFromJson(json);
// }
// extension FlightOfferEntityExtensions on FlightOfferEntity {
//   bool get hasDiscount => discountText.isNotEmpty;
// }
