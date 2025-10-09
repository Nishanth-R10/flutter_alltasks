// File: lib/features/search/presentation/widgets/search_chip_row.dart
import 'package:flutter/material.dart';
import 'search_chip_item.dart';

class SearchChipRow extends StatelessWidget {
  final List<String> titles;
  final List<IconData> icons;
  final double baseSize;

  const SearchChipRow({
    super.key,
    required this.titles,
    required this.icons,
    required this.baseSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchChipItem(
          title: titles[0],
          icon: icons[0],
          baseSize: baseSize,
        ),
        SizedBox(width: baseSize * 3),
        SearchChipItem(
          title: titles[1],
          icon: icons[1],
          baseSize: baseSize,
        ),
      ],
    );
  }
}