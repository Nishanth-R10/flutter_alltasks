
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/profile/presentation/app_size.dart';

class GroupCard extends StatelessWidget {
  final List<String> titles;
  final double fontScale;
  const GroupCard({super.key, required this.titles, required this.fontScale});

  @override
  Widget build(BuildContext context) {
    final borderRadius = AppSizes.s16;
    
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 0.5,
      child: Column(
        children: List.generate(titles.length, (index) {
          final isLast = index == titles.length - 1;
          return InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? borderRadius : 0),
              topRight: Radius.circular(index == 0 ? borderRadius : 0),
              bottomLeft: Radius.circular(isLast ? borderRadius : 0),
              bottomRight: Radius.circular(isLast ? borderRadius : 0),
            ),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.s16,
                vertical: AppSizes.s16,
              ),
              child: Row(
                children: [
                  Container(
                    width: AppSizes.s24, 
                    height: AppSizes.s24, 
                    decoration: BoxDecoration(
                      color: Colors.white, // White fill
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 1.5),
                    ),
                  ),
                  const SizedBox(width: AppSizes.s16),
                  Expanded(
                    child: Text(
                      titles[index],
                      style: GoogleFonts.poppins(
                        fontSize: fontScale,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 80, 140, 245)
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.north_east, size: 16, color:Color.fromARGB(255, 80, 140, 245)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}