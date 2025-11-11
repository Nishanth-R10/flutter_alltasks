import 'package:flutter/material.dart';
import '../app_colors/default_colors.dart';

class CommonLoadingWidget extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  const CommonLoadingWidget({
    super.key,
    this.baseColor,
    this.highlightColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: baseColor ?? DefaultColors.grayF4,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: ShimmerWidget(
        baseColor: baseColor ?? DefaultColors.grayF4,
        highlightColor: highlightColor ?? DefaultColors.white,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor ?? DefaultColors.grayF4,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatefulWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerWidget({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1.0 + (_controller.value * 2), 0.0),
              end: Alignment(1.0 + (_controller.value * 2), 0.0),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}