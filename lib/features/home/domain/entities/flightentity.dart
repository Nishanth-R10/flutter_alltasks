import 'package:equatable/equatable.dart';

class FlightEntity extends Equatable {
  final String id;
  final String airline;
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final double price;
  final int discount;
  final double discountedPrice;
  final String duration;
  final String type;
  final String flightNumber;

  const FlightEntity({
    required this.id,
    required this.airline,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.discount,
    required this.discountedPrice,
    required this.duration,
    required this.type,
    required this.flightNumber,
  });

  factory FlightEntity.fromJson(Map<String, dynamic> json) {
    final basePrice = (json['price'] as num).toDouble();
    final discount = (json['discount'] as num).toInt();
    final discountedPrice = basePrice - (basePrice * discount / 100);

    return FlightEntity(
      id: json['id'].toString(),
      airline: json['airline'].toString(),
      from: json['from'].toString(),
      to: json['to'].toString(),
      departureTime: json['departureTime'].toString(),
      arrivalTime: json['arrivalTime'].toString(),
      price: basePrice,
      discount: discount,
      discountedPrice: discountedPrice,
      duration: json['duration'].toString(),
      type: json['type'].toString(),
      flightNumber: json['flightNumber'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'airline': airline,
      'from': from,
      'to': to,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
      'price': price,
      'discount': discount,
      'discountedPrice': discountedPrice,
      'duration': duration,
      'type': type,
      'flightNumber': flightNumber,
    };
  }

  @override
  List<Object?> get props => [
    id, airline, from, to, departureTime, arrivalTime, 
    price, discount, discountedPrice, duration, type, flightNumber
  ];
}