import 'package:flutter/material.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'refer_earn_header.dart';
import 'refer_earn_content.dart';

class ReferEarnCard extends StatelessWidget {
  const ReferEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ReferEarnHeader(),
        SizedBox(height: MediaQueryUtils.h(8)),
        const ReferEarnContent(),
      ],
    );
  }
}