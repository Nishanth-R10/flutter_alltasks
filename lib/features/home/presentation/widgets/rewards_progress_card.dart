import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors/default_colors.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.18,
      child: Row(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: Listenable.merge([_shineAnimation, _fillAnimation]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _fillAnimation.value,
                  child: Opacity(
                    opacity: _fillAnimation.value,
                    child: Container(
                      height: screenHeight * 0.2,
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 12,
                        bottom: 12,
                        left: 12,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.93, -0.36),
                          end: Alignment(-0.93, 0.36),
                          colors: [
                            Color.fromARGB(255, 8, 97, 214),
                            DefaultColors.blueLightBase,
                            DefaultColors.blueLightBase,
                            Color.fromARGB(255, 102, 165, 248),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Start your reward Journey',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),

                          Container(
                            height: screenHeight * 0.05,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: DefaultColors.black,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Start now',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
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

          SizedBox(width: screenWidth * 0.08 ),

          Expanded(
            child: Container(
              height: screenHeight * 0.80,
              padding: const EdgeInsets.only(
                top: 20,
                right: 18,
                bottom: 10,
                left: 12,
              ),
              decoration: BoxDecoration(
                color: DefaultColors.whiteF3,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '300 Cashbonus Earned',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.black,
                      height: 1.3,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: DefaultColors.black24,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      'Collect now',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.white,
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
          const Color.fromARGB(255, 238, 236, 236).withOpacity(0.0),
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