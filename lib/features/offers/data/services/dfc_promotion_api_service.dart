import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';

class DfcPromotionApiService {
  final String baseUrl;
  final Duration timeoutDuration;

  DfcPromotionApiService({
    required this.baseUrl,
    this.timeoutDuration = const Duration(seconds: 5),
  });

  Future<Either<String, Map<String, dynamic>>> getDfcCreditCardPromotion() async {
    try {
      if (kDebugMode) {
        debugPrint(' Calling DFC Credit Card Promotion API...');
      }
      

      await Future.delayed(Duration(seconds: 2));
      
    
      final simulatedResponse = {
        "status": "success", 
        "message": "DFC credit card promotion loaded successfully",
        "data": {
          "id": "dfc_credit_card_2024",
          "title": "Get your DFC Credit Card today!",
          "description": "You are now eligible\nfor an Instant Credit\ncard with maximum\nlimit upto 5,000.00\nQAR.",
          "image_url": "assets/images/credit_card_offer.png",
          "apply_button_text": "Apply now",
          "close_button_text": "Close",
          "show_dont_show_again": true,
          "credit_limit": "5,000.00 QAR",
          "card_type": "Instant Credit Card", 
          "eligibility_status": "Pre-approved",
          "valid_until": "2024-12-31"
        }
      };

      if (kDebugMode) {
        debugPrint('DFC Promotion API Success');
      }
      return Right(simulatedResponse['data'] as Map<String, dynamic>);
      
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        debugPrint('API Timeout: $e');
      }
      return Left('Request timeout');
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DFC Promotion API Error: $e');
      }
      return Left('Network error');
    }
  }

  Future<Either<String, bool>> hidePromotion(String promotionId) async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      if (kDebugMode) {
        debugPrint('Promotion hidden in API: $promotionId');
      }
      return const Right(true);
    } catch (e) {
      return Left('Failed to hide promotion');
    }
  }
}