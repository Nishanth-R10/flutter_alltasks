// import 'package:fpdart/fpdart.dart';
// import 'package:tasks/features/home/domain/entities/flightentity.dart';

// class FlightRepository {
  
//   Future<Either<String, List<FlightEntity>>> getFlights() async {
//     try {
//       print('🔄 Fetching flights from API...');
      
//       // Simulate API delay
//       await Future.delayed(const Duration(seconds: 2));
      
//       // DUMMY API RESPONSE (structured like real API)
//       final dummyApiResponse = {
//         "status": "success",
//         "message": "Flights retrieved successfully",
//         "data": {
//           "flights": [
//             {
//               "id": "1",
//               "airline": "Qatar Airways",
//               "from": "Doha",
//               "to": "Dubai", 
//               "departureTime": "08:00",
//               "arrivalTime": "10:00",
//               "price": 1200.0,
//               "discount": 15,
//               "duration": "2h 00m",
//               "type": "Direct",
//               "flightNumber": "QR101"
//             },
//             {
//               "id": "2", 
//               "airline": "Emirates",
//               "from": "Dubai",
//               "to": "London",
//               "departureTime": "14:30",
//               "arrivalTime": "18:45",
//               "price": 2500.0,
//               "discount": 20,
//               "duration": "7h 15m",
//               "type": "Direct",
//               "flightNumber": "EK202"
//             },
//             {
//               "id": "3",
//               "airline": "British Airways",
//               "from": "London",
//               "to": "New York",
//               "departureTime": "11:15",
//               "arrivalTime": "14:30",
//               "price": 3200.0,
//               "discount": 25,
//               "duration": "8h 15m",
//               "type": "Direct",
//               "flightNumber": "BA303"
//             },
//             {
//               "id": "4",
//               "airline": "Air France",
//               "from": "Paris",
//               "to": "Tokyo",
//               "departureTime": "16:45",
//               "arrivalTime": "09:30",
//               "price": 2800.0,
//               "discount": 18,
//               "duration": "13h 45m",
//               "type": "1 Stop",
//               "flightNumber": "AF404"
//             },
//             {
//               "id": "5",
//               "airline": "Singapore Airlines",
//               "from": "Singapore",
//               "to": "Sydney",
//               "departureTime": "22:00",
//               "arrivalTime": "07:30",
//               "price": 1800.0,
//               "discount": 22,
//               "duration": "8h 30m",
//               "type": "Direct",
//               "flightNumber": "SQ505"
//             },
//             {
//               "id": "6",
//               "airline": "Etihad Airways",
//               "from": "Abu Dhabi",
//               "to": "Istanbul",
//               "departureTime": "13:20",
//               "arrivalTime": "16:40",
//               "price": 950.0,
//               "discount": 12,
//               "duration": "4h 20m",
//               "type": "Direct",
//               "flightNumber": "EY606"
//             }
//           ]
//         },
//         "pagination": {
//           "total": 6,
//           "page": 1,
//           "limit": 10
//         }
//       };
      
//       // Parse the DUMMY API response like real API
//       final flights = _parseApiResponse(dummyApiResponse);
//       print('✅ Dummy API Success: ${flights.length} flights loaded');
//       return Right(flights);
      
//     } catch (e) {
//       print('❌ Dummy API Error: $e');
//       return Left('API Error: $e');
//     }
//   }

//   List<FlightEntity> _parseApiResponse(Map<String, dynamic> apiResponse) {
//     try {
//       // Parse like real API response structure
//       final List<dynamic> flightsData = apiResponse['data']['flights'];
      
//       return flightsData.map((flightJson) {
//         return FlightEntity.fromJson(flightJson);
//       }).toList();
//     } catch (e) {
//       print('❌ Parsing error: $e');
//       throw Exception('Failed to parse API response: $e');
//     }
//   }
// }