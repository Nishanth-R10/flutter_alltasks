// import 'package:equatable/equatable.dart';

// class FlightOfferEntity extends Equatable {
//   final String id;
//   final String airline;
//   final String route;
//   final String departureTime;
//   final String arrivalTime;
//   final double originalPrice;
//   final double discountedPrice; 
//   final int discountPercentage;
//   final String duration;
//   final String stops;
//   final String aircraft;
//   final String dealType; // "HOT", "LIMITED", "EXCLUSIVE"

//   const FlightOfferEntity({
//     required this.id,
//     required this.airline,
//     required this.route,
//     required this.departureTime,
//     required this.arrivalTime,
//     required this.originalPrice,
//     required this.discountedPrice,
//     required this.discountPercentage,
//     required this.duration,
//     required this.stops,
//     required this.aircraft,
//     required this.dealType,
//   });

//   factory FlightOfferEntity.generateRandom(String fromCity, String toCity) {
//     final airlines = ['Emirates', 'Qatar Airways', 'Etihad', 'Fly Dubai', 'Air Arabia', 'Saudia'];
//     final aircrafts = ['Boeing 777', 'Airbus A380', 'Boeing 787', 'Airbus A320'];
//     final dealTypes = ['HOT', 'LIMITED', 'EXCLUSIVE'];
    
//     final airline = airlines[DateTime.now().microsecondsSinceEpoch % airlines.length];
//     final aircraft = aircrafts[DateTime.now().microsecondsSinceEpoch % aircrafts.length];
//     final dealType = dealTypes[DateTime.now().microsecondsSinceEpoch % dealTypes.length];
    
//     final basePrice = 800.0 + (DateTime.now().microsecondsSinceEpoch % 1200);
//     final discount = 15 + (DateTime.now().microsecondsSinceEpoch % 25); // 15-40% discount
//     final discountedPrice = basePrice * (1 - discount / 100);
    
//     // Generate random times
//     final departureHour = 6 + (DateTime.now().microsecondsSinceEpoch % 18);
//     final durationHours = 2 + (DateTime.now().microsecondsSinceEpoch % 8);
//     final arrivalHour = (departureHour + durationHours) % 24;
    
//     return FlightOfferEntity(
//       id: 'FL${DateTime.now().millisecondsSinceEpoch}',
//       airline: airline,
//       route: '$fromCity → $toCity',
//       departureTime: '${departureHour.toString().padLeft(2, '0')}:00',
//       arrivalTime: '${arrivalHour.toString().padLeft(2, '0')}:00',
//       originalPrice: basePrice,
//       discountedPrice: discountedPrice,
//       discountPercentage: discount,
//       duration: '${durationHours}h 0m',
//       stops: (DateTime.now().microsecondsSinceEpoch % 3 == 0) ? 'Non-stop' : '1 stop',
//       aircraft: aircraft,
//       dealType: dealType,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     id, airline, route, departureTime, arrivalTime, 
//     originalPrice, discountedPrice, discountPercentage,
//     duration, stops, aircraft, dealType
//   ];
// }