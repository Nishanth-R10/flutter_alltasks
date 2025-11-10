import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Simple UI State Providers - No data, just UI state
final selectedOfferTabProvider = StateProvider<int>((ref) => 0);