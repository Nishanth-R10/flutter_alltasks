import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors/default_colors.dart';
import '../controller/search_provider.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onClear;
  final double screenWidth;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onClear,
    required this.screenWidth,
  });

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSearchContainer(context)),
        SizedBox(width: widget.screenWidth * 0.01),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildSearchContainer(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: AnimatedBorderPainter(
            animationValue: _animation.value,
            borderRadius: 50,
            strokeWidth: 2.5,
          ),
          child: Container(
            height: widget.screenWidth * 0.12,
            decoration: BoxDecoration(
              border: Border.all(color: DefaultColors.grayCA.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(
                  Icons.search,
                  size: widget.screenWidth * 0.05,
                  color: DefaultColors.gray62,
                ),
                SizedBox(width: widget.screenWidth * 0.02),
                Expanded(child: _buildTextField()),
                _buildClearButton(context),
                const SizedBox(width: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search for services...",
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: DefaultColors.gray7D,
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: DefaultColors.black,
      ),
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state = value;
      },
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: widget.screenWidth * 0.08,
      height: widget.screenWidth * 0.08,
      decoration: BoxDecoration(
        color: DefaultColors.gray7D,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.close, size: widget.screenWidth * 0.04, color: DefaultColors.white),
        onPressed: widget.onClear,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: widget.onCancel,
      child: Text(
        "Cancel",
        style: GoogleFonts.poppins(
          color: DefaultColors.blue9D,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AnimatedBorderPainter extends CustomPainter {
  final double animationValue;
  final double borderRadius;
  final double strokeWidth;

  AnimatedBorderPainter({
    required this.animationValue,
    required this.borderRadius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final path = Path()..addRRect(rrect);
    final pathMetrics = path.computeMetrics().first;
    final totalLength = pathMetrics.length;

    final width = size.width;
    final height = size.height;
    final topLength = width;
    final rightLength = height;
    final bottomLength = width;
    
    final currentPos = (animationValue * totalLength) % totalLength;
    
    Path? animatedPath;
    
    if (currentPos < topLength) {
      final lineLength = topLength * 0.8;
      final progress = currentPos / topLength;
      
      final lineCenter = progress * topLength;
      final startPoint = (lineCenter - lineLength / 2).clamp(0.0, topLength);
      final endPoint = (lineCenter + lineLength / 2).clamp(0.0, topLength);
      
      if (endPoint > startPoint) {
        animatedPath = pathMetrics.extractPath(startPoint, endPoint);
      }
    }
    else if (currentPos < topLength + rightLength) {
      return;
    }
    else if (currentPos < topLength + rightLength + bottomLength) {
      final bottomStart = topLength + rightLength;
      final lineLength = bottomLength * 0.8;
      final bottomProgress = (currentPos - bottomStart) / bottomLength;
      
      final lineCenter = bottomStart + (bottomProgress * bottomLength);
      final startPoint = (lineCenter - lineLength / 2).clamp(bottomStart, bottomStart + bottomLength);
      final endPoint = (lineCenter + lineLength / 2).clamp(bottomStart, bottomStart + bottomLength);
      
      if (endPoint > startPoint) {
        animatedPath = pathMetrics.extractPath(startPoint, endPoint);
      }
    }
    else {
      return;
    }

    if (animatedPath == null) return;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          DefaultColors.blue9D.withOpacity(0.0),
          DefaultColors.blue9D.withOpacity(0.4),
          DefaultColors.blue9D.withOpacity(0.8),
          DefaultColors.blue9D,
          DefaultColors.blue9D.withOpacity(0.8),
          DefaultColors.blue9D.withOpacity(0.4),
          DefaultColors.blue9D.withOpacity(0.0),
        ],
        stops: const [0.0, 0.2, 0.35, 0.5, 0.65, 0.8, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(AnimatedBorderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}