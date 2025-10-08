import 'package:flutter/material.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'gradient_border_painter.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtils.init(context);
    
    return Stack(
      children: [
        _buildGridContainer(),
        _buildGradientBorder(),
      ],
    );
  }

  Widget _buildGridContainer() {
    return Container(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(92),
      padding: EdgeInsets.all(MediaQueryUtils.w(12)),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
        border: Border.all(
          color: Colors.grey[400]!,
          width: MediaQueryUtils.w(1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: MediaQueryUtils.r(8),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(icon: Icons.swap_horiz, label: 'Transfer'),
          _actionButton(icon: Icons.list, label: 'Request'),
          _actionButton(icon: Icons.trending_up, label: 'Stocks'),
          _actionButton(icon: Icons.auto_awesome, label: 'Products'),
        ],
      ),
    );
  }

  Widget _buildGradientBorder() {
    return Positioned(
      top: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(MediaQueryUtils.r(16)),
        ),
        child: CustomPaint(
          size: Size(MediaQueryUtils.w(100), MediaQueryUtils.h(92)),
          painter: GradientBorderPainter(
            borderRadius: MediaQueryUtils.r(16),
            strokeWidth: MediaQueryUtils.w(2.5),
          ),
        ),
      ),
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQueryUtils.w(48),
          height: MediaQueryUtils.w(48),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
          ),
          child: Center(
            child: Icon(
              icon,
              size: MediaQueryUtils.sp(24),
              color: const Color(0xFF131B20),
            ),
          ),
        ),
        SizedBox(height: MediaQueryUtils.h(4)),
        SizedBox(
          width: MediaQueryUtils.w(58),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Diodrum Arabic',
              fontWeight: FontWeight.w500,
              fontSize: MediaQueryUtils.sp(11),
              height: 1.2,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
}