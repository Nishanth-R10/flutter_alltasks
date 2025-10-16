import 'package:flutter/material.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/infrastructure/offer_repository.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section/flight_offers_dailog.dart';
import 'offers_header.dart';
import 'offer_item.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    final offers = OfferRepository().getOffers();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersHeader(),
        SizedBox(height: MediaQueryUtils.h(0)), 
        SizedBox(
          height: MediaQueryUtils.h(100), 
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            separatorBuilder: (_, __) => SizedBox(width: MediaQueryUtils.w(12)),
            itemBuilder: (context, index) {
              final item = offers[index];
              return OfferItem(
                offer: item,
                onTap: () {
                  // Handle tap for flight booking offers
                  if (item.title == "Offers on Flight Booking") {
                    // Navigate to flight offers screen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FlightOffersScreen(),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}