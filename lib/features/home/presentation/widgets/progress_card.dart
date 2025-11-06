import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
import 'package:tasks/core/providers/theme_provider.dart';

class ProgressCard extends ConsumerStatefulWidget {
  const ProgressCard({super.key});

  @override
  ConsumerState<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends ConsumerState<ProgressCard>
    with TickerProviderStateMixin {
  late AnimationController _shineController;
  late AnimationController _fillController;
  late Animation<double> _shineAnimation;
  late Animation<double> _fillAnimation;

  @override
  void initState() {
    super.initState();

    _fillController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fillAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _fillController, curve: Curves.easeOut),
    );

    _shineController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();

    _shineAnimation = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _shineController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _fillController.forward();
  }

  @override
  void dispose() {
    _shineController.dispose();
    _fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    final theme = ref.watch(themeProvider);
    MediaQueryUtils.init(context);

    return SizedBox(
      width: MediaQueryUtils.w(343),
      height: MediaQueryUtils.h(140),
      child: Row(
        children: [
          /// FIRST CARD
          Expanded(
            child: AnimatedBuilder(
              animation: Listenable.merge([_shineAnimation, _fillAnimation]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _fillAnimation.value,
                  child: Opacity(
                    opacity: _fillAnimation.value,
                    child: Container(
                      height: MediaQueryUtils.h(157),
                      padding: EdgeInsets.only(
                        top: MediaQueryUtils.h(22),
                        right: MediaQueryUtils.w(12),
                        bottom: MediaQueryUtils.h(12),
                        left: MediaQueryUtils.w(12),
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.93, -0.36),
                          end: Alignment(-0.93, 0.36),
                          colors: [
                            Color(0xFF2F75E5),
                            Color(0xFF3E97C8),
                            Color(0xFF3E97C8),
                            Color(0xFF2B74E8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Start your reward Journey',
                            style: GoogleFonts.poppins(
                              fontSize: MediaQueryUtils.sp(14),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),

                          Container(
                            height: MediaQueryUtils.h(40),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: MediaQueryUtils.w(20),
                                    vertical: MediaQueryUtils.h(10),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                      MediaQueryUtils.r(25),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Start now',
                                    style: GoogleFonts.poppins(
                                      fontSize: MediaQueryUtils.sp(12),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      MediaQueryUtils.r(25),
                                    ),
                                    child: AnimatedBuilder(
                                      animation: _shineAnimation,
                                      builder: (_, __) {
                                        return CustomPaint(
                                          painter: DiagonalShinePainter(
                                            progress: _shineAnimation.value,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(width: MediaQueryUtils.w(16)),

          /// SECOND CARD
          Expanded(
            child: Container(
              height: MediaQueryUtils.h(140),
              padding: EdgeInsets.only(
                top: MediaQueryUtils.h(22),
                right: MediaQueryUtils.w(19),
                bottom: MediaQueryUtils.h(10),
                left: MediaQueryUtils.w(12),
              ),
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark 
                    ? const Color(0xFF2A2A2A) 
                    : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(MediaQueryUtils.r(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '300 Cashbonus Earned',
                    style: GoogleFonts.poppins(
                      fontSize: MediaQueryUtils.sp(14),
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                      height: 1.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQueryUtils.w(20),
                      vertical: MediaQueryUtils.h(12),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(MediaQueryUtils.r(25)),
                    ),
                    child: Text(
                      'Collect now',
                      style: GoogleFonts.poppins(
                        fontSize: MediaQueryUtils.sp(12),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiagonalShinePainter extends CustomPainter {
  final double progress;

  DiagonalShinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.0),
        ],
        stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final stripeWidth = size.width * 0.4;
    final totalDistance = size.width + size.height;
    final offset = progress * totalDistance - stripeWidth;

    path.moveTo(offset, 0);
    path.lineTo(offset + stripeWidth, 0);
    path.lineTo(offset + stripeWidth - size.height, size.height);
    path.lineTo(offset - size.height, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DiagonalShinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}