import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/home/domain/entities/flightentity.dart';
import 'package:tasks/features/home/infrastructure/flight_repository.dart';

final flightRepositoryProvider = Provider<FlightRepository>((ref) {
  return FlightRepository();
});

final flightsFutureProvider = FutureProvider<List<FlightEntity>>((ref) async {
  final repository = ref.read(flightRepositoryProvider);
  final result = await repository.getFlights();
  
  return result.fold(
    (error) => throw error,
    (flights) => flights,
  );
});