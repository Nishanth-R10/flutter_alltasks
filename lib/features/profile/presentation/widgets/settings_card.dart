import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final bool compact;
  final bool bigCard;
  final bool verticalLayout;
  final IconData? icon;
  final double fontScale;
  final bool showCircle;

  const SettingCard({
    super.key,
    required this.title,
    this.compact = false,
    this.bigCard = false,
    this.verticalLayout = false,
    this.icon,
    this.fontScale = 14,
    this.showCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppSizes.s16;
    final verticalPadding = bigCard ? AppSizes.s16 : AppSizes.s16;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.s16),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s16),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showCircle)
                Container(
                  width: AppSizes.s24, 
                  height: AppSizes.s24, 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                ),
              if (showCircle) const SizedBox(width: AppSizes.s16),
              if (icon != null) Icon(icon, size: AppSizes.s24, color: Colors.black87),
              if (icon != null) const SizedBox(width: AppSizes.s8),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: fontScale,
                    fontWeight: FontWeight.w600,
                   color:Color(0xFF4197CB),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.north_east, size: 16, color:Color(0xFF4197CB),),
            ],
          ),
        ),
      ),
    );
  }
}