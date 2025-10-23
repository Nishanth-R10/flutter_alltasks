// lib/features/home/presentation/widgets/offer_section/offer_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/features/home/application/offer_provider.dart';
import 'package:tasks/features/home/presentation/widgets/offer_section/shrimmer/shimmer_widget.dart';
import 'package:tasks/features/offers/domain/entities/offer_entity.dart';
import 'offers_header.dart';
import 'offer_item.dart';

class OffersSection extends ConsumerWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryUtils.init(context);
  final offersAsync = ref.watch(offersViewProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersHeader(),
        SizedBox(height: MediaQueryUtils.h(8)),
        SizedBox(
          height: MediaQueryUtils.h(120),
          child: offersAsync.when(
            loading: () => _buildOffersShimmer(),
            error: (error, stack) => _buildOffersError(error, ref),
          data: (offers) => _buildOffersList(offers),
          ),
        ),
      ],
    );
  }

  Widget _buildOffersList(List<dynamic> offers) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: offers.length,
      separatorBuilder: (_, __) => SizedBox(width: MediaQueryUtils.w(12)),
      itemBuilder: (context, index) {
        final item = offers[index];
        return OfferItem(
          offerView: item,
          onTap: () {
    
          },
        );
      },
    );
  }

  Widget _buildOffersShimmer() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(width: MediaQueryUtils.w(12)),
      itemBuilder: (context, index) {
        return ShimmerWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQueryUtils.w(80),
                height: MediaQueryUtils.w(80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: MediaQueryUtils.h(8)),
              Container(
                width: MediaQueryUtils.w(70),
                height: MediaQueryUtils.h(30),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(MediaQueryUtils.r(6)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOffersError(Object error, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: MediaQueryUtils.w(24)),
          SizedBox(height: MediaQueryUtils.h(8)),
          Text(
            'Failed to load offers',
            style: TextStyle(
              fontSize: MediaQueryUtils.sp(12),
              color: Colors.red,
            ),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),
          ElevatedButton(
            onPressed: () => ref.invalidate(offersFutureProvider),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQueryUtils.w(12),
                vertical: MediaQueryUtils.h(6),
              ),
            ),
            child: Text(
              'Retry',
              style: TextStyle(fontSize: MediaQueryUtils.sp(10)),
            ),
          ),
        ],
      ),
    );
  }
}