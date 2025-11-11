import 'package:flutter/material.dart';
import 'refer_earn_header.dart';
import 'refer_earn_content.dart';

class ReferEarnCard extends StatelessWidget {
  const ReferEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ReferEarnHeader(),
        SizedBox(height: screenHeight * 0.01),
        const ReferEarnContent(),
      ],
    );
  }
}