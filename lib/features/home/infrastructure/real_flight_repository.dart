// // Replace your real_flight_repository.dart with this

// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/core/network/api_service.dart';
// import 'package:tasks/core/network/api_constants.dart';
// import 'package:tasks/features/home/domain/entities/flight_entity.dart';
// import 'package:tasks/features/home/domain/entities/flightentity.dart';
// import 'package:tasks/features/home/domain/entities/real_flightentity.dart';

// class RealFlightRepository {
//   final ApiService _apiService;

//   RealFlightRepository(this._apiService);

//   // Get real flights from DummyJSON API (working API, no auth needed)
//   Future<Either<String, List<FlightEntity>>> getRealFlights() async {
//     try {
//       print('🔄 Calling DummyJSON API for flights...');
      
//       final result = await _apiService.getWithBaseUrl<Map<String, dynamic>>(
//         ApiConstants.dummyJsonBaseUrl,
//         '/products',
//         queryParameters: {
//           'limit': 10,
//           'skip': 0,
//         },
//       );

//       return result.fold(
//         (error) {
//           print('❌ DummyJSON API failed: $error');
//           // Fallback to mock data if API fails
//           return Right(_getMockFlightData());
//         },
//         (data) {
//           print('✅ API Success! Response received');
          
//           final List<dynamic> products = data['products'] ?? [];
          
//           if (products.isEmpty) {
//             print('⚠️ No products found, using mock data');
//             return Right(_getMockFlightData());
//           }

//           // Convert products to flights
//           final flightList = products
//               .map((product) => FlightEntity.fromJson(product as Map<String, dynamic>))
//               .toList();
          
//           print('✅ Parsed ${flightList.length} flights from API');
          
//           // Sort by discount
//           flightList.sort((a, b) => b.discount.compareTo(a.discount));
          
//           return Right(flightList);
//         },
//       );
//     } catch (e) {
//       print('❌ Flight API exception: $e');
//       return Right(_getMockFlightData());
//     }
//   }

//   // Alternative: Try AviationStack API (requires API key)
//   Future<Either<String, List<FlightEntity>>> getAviationStackFlights() async {
//     try {
//       print('🔄 Trying AviationStack API...');
      
//       final result = await _apiService.getWithBaseUrl<Map<String, dynamic>>(
//         ApiConstants.aviationBaseUrl,
//         '/flights',
//         queryParameters: {
//           'access_key': ApiConstants.aviationApiKey,
//           'dep_iata': 'DXB',
//           'limit': 10,
//         },
//       );

//       return result.fold(
//         (error) {
//           print('❌ AviationStack API failed: $error');
//           return Left('AviationStack API failed: $error');
//         },
//         (data) {
//           final List<dynamic> flights = data['data'] ?? [];
          
//           if (flights.isEmpty) {
//             return Left('No flights found from AviationStack');
//           }

//           // Parse aviation data to FlightEntity
//           final flightList = flights
//               .take(10)
//               .map((flight) => _parseAviationFlight(flight))
//               .toList();
          
//           return Right(flightList);
//         },
//       );
//     } catch (e) {
//       print('❌ AviationStack exception: $e');
//       return Left('Exception: $e');
//     }
//   }

//   // Parse AviationStack API response to FlightEntity
//   FlightEntity _parseAviationFlight(Map<String, dynamic> json) {
//     final flight = json['flight'] ?? {};
//     final departure = json['departure'] ?? {};
//     final arrival = json['arrival'] ?? {};
//     final airline = json['airline'] ?? {};

//     final id = int.tryParse(flight['number']?.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '1') ?? 1;
//     final airlineName = airline['name']?.toString() ?? 'Unknown Airline';
//     final depAirport = departure['airport']?.toString() ?? 'Dubai';
//     final arrAirport = arrival['airport']?.toString() ?? 'Unknown';
    
//     // Extract time from scheduled strings
//     final depTime = _extractTime(departure['scheduled']?.toString());
//     final arrTime = _extractTime(arrival['scheduled']?.toString());
    
//     final basePrice = 1500.0 + (id * 100);
//     final discount = 15 + (id % 20);

//     return FlightEntity(
//       id: id,
//       airline: airlineName,
//       from: depAirport,
//       to: arrAirport,
//       departureTime: depTime,
//       arrivalTime: arrTime,
//       price: basePrice,
//       discount: discount,
//       flightNumber: flight['number']?.toString() ?? 'FL$id',
//       duration: '${4 + (id % 4)}h 30m',
//       type: id % 3 == 0 ? 'Direct' : '1 Stop',
//     );
//   }

//   // Extract time from ISO string
//   String _extractTime(String? isoString) {
//     if (isoString == null) return '00:00';
//     try {
//       final dateTime = DateTime.parse(isoString);
//       return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//     } catch (e) {
//       return '00:00';
//     }
//   }

//   // Get real airlines from AirLabs API (requires API key)
//   Future<Either<String, List<String>>> getRealAirlines() async {
//     try {
//       final result = await _apiService.getWithBaseUrl<Map<String, dynamic>>(
//         ApiConstants.airLabsBaseUrl,
//         '/airlines',
//         queryParameters: {
//           'api_key': ApiConstants.airLabsApiKey,
//         },
//       );

//       return result.fold(
//         (error) => Left('Failed to fetch airlines: $error'),
//         (data) {
//           final List<dynamic> airlinesData = data['response'] ?? [];
//           final airlines = airlinesData
//               .take(10)
//               .map((airline) => airline['name']?.toString() ?? 'Unknown Airline')
//               .where((name) => name != 'Unknown Airline')
//               .toList();
//           return Right(airlines);
//         },
//       );
//     } catch (e) {
//       return Left('Airlines API exception: $e');
//     }
//   }

//   // Mock data fallback (when APIs fail or for testing)
//   List<FlightEntity> _getMockFlightData() {
//     print('📦 Using mock flight data');
    
//     final airlines = [
//       'Emirates',
//       'Qatar Airways',
//       'Etihad Airways',
//       'Fly Dubai',
//       'Air Arabia',
//       'Saudia'
//     ];
    
//     final routes = [
//       ['Dubai', 'London'],
//       ['Dubai', 'Paris'],
//       ['Dubai', 'New York'],
//       ['Dubai', 'Singapore'],
//       ['Dubai', 'Istanbul'],
//       ['Dubai', 'Bangkok'],
//     ];

//     return List.generate(6, (index) {
//       final route = routes[index % routes.length];
//       final airline = airlines[index % airlines.length];
//       final basePrice = [2200.0, 2000.0, 3500.0, 1800.0, 1200.0, 1600.0][index];
//       final discount = 15 + (index * 3);
      
//       final depHour = 8 + (index * 2);
//       final arrHour = depHour + 6;

//       return FlightEntity(
//         id: index + 1,
//         airline: airline,
//         from: route[0],
//         to: route[1],
//         departureTime: '${depHour.toString().padLeft(2, '0')}:00',
//         arrivalTime: '${arrHour.toString().padLeft(2, '0')}:30',
//         price: basePrice,
//         discount: discount,
//         flightNumber: '${airline.substring(0, 2).toUpperCase()}${200 + index}',
//         duration: '${5 + index}h 30m',
//         type: index % 3 == 0 ? 'Direct' : '1 Stop',
//       );
//     });
//   }
// }