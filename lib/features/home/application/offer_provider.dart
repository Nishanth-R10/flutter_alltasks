
// lib/features/home/application/offer_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/network/api_service.dart';
import 'package:tasks/core/network/dio_client.dart';
import 'package:tasks/features/home/domain/entities/flight_offer_entity.dart';
import 'package:tasks/features/home/domain/entities/gold_offer_entity.dart';
import 'package:tasks/features/home/domain/entities/investment_offer_entity.dart';
import 'package:tasks/features/offers/domain/entities/offer_entity.dart';
import 'package:tasks/features/home/domain/entities/repository/flight_offer_repository.dart';
import 'package:tasks/features/home/domain/entities/repository/gold_offer_repository.dart';
import 'package:tasks/features/home/domain/entities/repository/investment_offer_repository.dart';
import 'package:tasks/features/home/domain/entities/repository/tour_offer_repository.dart';
import 'package:tasks/features/home/domain/entities/tour_offer_entity.dart';

part 'offer_provider_repositories.dart';
part 'offer_provider_futures.dart';
part 'offer_provider_viewmodels.dart';

// Dio Client Provider
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

