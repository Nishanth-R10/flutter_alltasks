import 'package:flutter/material.dart';
import '../app_colors/default_colors.dart';

class CommonErrorWidget extends StatelessWidget {
  final String message;
  final String? buttonText;
  final VoidCallback? onRetry;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double iconSize;
  final double fontSize;

  const CommonErrorWidget({
    super.key,
    required this.message,
    this.buttonText,
    this.onRetry,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.iconSize = 48,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? DefaultColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: DefaultColors.grayCA),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.error_outline,
            color: textColor ?? DefaultColors.redDB,
            size: iconSize,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: textColor ?? DefaultColors.black,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: DefaultColors.blueLightBase,
                foregroundColor: DefaultColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(buttonText ?? 'Retry'),
            ),
          ],
        ],
      ),
    );
  }
}