import 'package:flutter/material.dart';
import 'search_chip_item.dart';

class SearchChipRow extends StatelessWidget {
  final List<String> titles;
  final List<IconData> icons;

  const SearchChipRow({
    super.key,
    required this.titles,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Row(
      children: [
        SearchChipItem(
          title: titles[0],
          icon: icons[0],
        ),
        SizedBox(width: screenWidth * 0.03),
        SearchChipItem(
          title: titles[1],
          icon: icons[1],
        ),
      ],
    );
  }
}