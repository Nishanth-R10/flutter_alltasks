// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tasks/features/home/application/flight_provider.dart';
// import 'package:tasks/features/home/domain/entities/flightentity.dart';
// import 'package:tasks/features/home/presentation/widgets/offer_section/shrimmer/shimmer_widget.dart';

// class FlightOffersScreen extends ConsumerStatefulWidget {
//   const FlightOffersScreen({super.key});

//   @override
//   ConsumerState<FlightOffersScreen> createState() => _FlightOffersScreenState();
// }

// class _FlightOffersScreenState extends ConsumerState<FlightOffersScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Invalidate the provider every time the screen is opened
//     // This ensures fresh data and shimmer effect on every visit
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.invalidate(flightsFutureProvider);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final flightsAsync = ref.watch(flightsFutureProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Flight Offers',
//           style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               ref.invalidate(flightsFutureProvider);
//             },
//           ),
//         ],
//       ),
//       body: flightsAsync.when(
//         loading: () => _buildShimmerLoadingState(),
//         error: (error, stack) => _buildErrorState(error, ref),
//         data: (flights) => _buildFlightList(flights, context, ref),
//       ),
//     );
//   }

//   Widget _buildShimmerLoadingState() {
//     return Column(
//       children: [
//         // API Status Banner Shimmer
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16),
//           color: Colors.green[50],
//           child: ShimmerWidget(
//             baseColor: Colors.green[100]!,
//             highlightColor: Colors.green[50]!,
//             child: Row(
//               children: [
//                 ShimmerBox(width: 20, height: 20, borderRadius: BorderRadius.circular(10)),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ShimmerLine(width: 150, height: 13),
//                       const SizedBox(height: 4),
//                       ShimmerLine(width: 200, height: 11),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         // Flight Cards Shimmer
//         Expanded(
//           child: ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: 5, 
//             itemBuilder: (context, index) {
//               return _buildFlightCardShimmer();
//             },
//           ),
//         ),

//         // Loading indicator at bottom
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 24,
//                 height: 24,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2.5,
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Text(
//                 'Loading flight offers...',
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.blue[700],
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFlightCardShimmer() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ShimmerWidget(
//         child: Column(
//           children: [
//             // Header Shimmer
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.blue[50],
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       ShimmerBox(width: 24, height: 24, borderRadius: BorderRadius.circular(12)),
//                       const SizedBox(width: 8),
//                       ShimmerLine(width: 120, height: 16),
//                     ],
//                   ),
//                   ShimmerBox(
//                     width: 70,
//                     height: 28,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ],
//               ),
//             ),

//             // Flight Details Shimmer
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   // Route Shimmer
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // From
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ShimmerLine(width: 60, height: 18),
//                             const SizedBox(height: 4),
//                             ShimmerLine(width: 80, height: 14),
//                           ],
//                         ),
//                       ),

//                       // Arrow
//                       Column(
//                         children: [
//                           ShimmerBox(width: 24, height: 24, borderRadius: BorderRadius.circular(12)),
//                           const SizedBox(height: 4),
//                           ShimmerLine(width: 50, height: 12),
//                           const SizedBox(height: 2),
//                           ShimmerLine(width: 60, height: 10),
//                         ],
//                       ),

//                       // To
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             ShimmerLine(width: 60, height: 18),
//                             const SizedBox(height: 4),
//                             ShimmerLine(width: 80, height: 14),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   // Flight Number Shimmer
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: ShimmerBox(
//                       width: 120,
//                       height: 28,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),

//                   const SizedBox(height: 16),

//                   // Price Section Shimmer
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ShimmerLine(width: 100, height: 24),
//                           const SizedBox(height: 4),
//                           ShimmerLine(width: 80, height: 14),
//                         ],
//                       ),
//                       ShimmerBox(
//                         width: 100,
//                         height: 40,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildErrorState(Object error, WidgetRef ref) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.error_outline, color: Colors.red, size: 64),
//             const SizedBox(height: 16),
//             Text(
//               'Failed to Load Flights',
//               style: GoogleFonts.poppins(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               error.toString(),
//               textAlign: TextAlign.center,
//               style: GoogleFonts.poppins(
//                 fontSize: 14,
//                 color: Colors.grey[600],
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton.icon(
//               onPressed: () {
//                 ref.invalidate(flightsFutureProvider);
//               },
//               icon: const Icon(Icons.refresh),
//               label: const Text('Retry'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFlightList(List<FlightEntity> flights, BuildContext context, WidgetRef ref) {
//     return Column(
//       children: [
//         // API Status Banner
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16),
//           color: Colors.green[50],
//           child: Row(
//             children: [
//               Icon(Icons.autorenew, color: Colors.green[700], size: 20),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       ' LIVE FLIGHT DATA',
//                       style: GoogleFonts.poppins(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green[800],
//                       ),
//                     ),
//                     Text(
//                       'Data refreshes on pull-to-refresh or tap reload',
//                       style: GoogleFonts.poppins(
//                         fontSize: 11,
//                         color: Colors.green[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.refresh, color: Colors.green[700]),
//                 onPressed: () {
//                   ref.invalidate(flightsFutureProvider);
//                 },
//               ),
//             ],
//           ),
//         ),

//         // Flight Cards with Pull to Refresh
//         Expanded(
//           child: RefreshIndicator(
//             onRefresh: () async {
//               ref.invalidate(flightsFutureProvider);
              
//               await Future.delayed(const Duration(milliseconds: 100));
//             },
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: flights.length,
//               itemBuilder: (context, index) {
//                 final flight = flights[index];
//                 return _buildFlightCard(flight, context);
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFlightCard(FlightEntity flight, BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
          
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.flight_takeoff, color: Colors.blue[700], size: 24),
//                     const SizedBox(width: 8),
//                     Text(
//                       flight.airline,
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[900],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     '${flight.discount}% OFF',
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Flight Details
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 // Route
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // From
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             flight.from,
//                             style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             flight.departureTime,
//                             style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Arrow with duration
//                     Column(
//                       children: [
//                         Icon(Icons.arrow_forward, color: Colors.blue[700]),
//                         const SizedBox(height: 4),
//                         Text(
//                           flight.duration,
//                           style: GoogleFonts.poppins(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                         Text(
//                           flight.type,
//                           style: GoogleFonts.poppins(
//                             fontSize: 10,
//                             color: Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),

//                     // To
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             flight.to,
//                             style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             flight.arrivalTime,
//                             style: GoogleFonts.poppins(
//                               fontSize: 14,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 // Flight Number
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     'Flight: ${flight.flightNumber}',
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 // Price Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'QAR ${flight.discountedPrice.toStringAsFixed(0)}',
//                           style: GoogleFonts.poppins(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green[700],
//                           ),
//                         ),
//                         Text(
//                           'QAR ${flight.price.toStringAsFixed(0)}',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             color: Colors.grey[500],
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Booking ${flight.flightNumber}...'),
//                             backgroundColor: Colors.green,
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 24,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(
//                         'Book Now',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }