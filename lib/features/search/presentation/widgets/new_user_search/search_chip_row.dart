<<<<<<< HEAD
// File: lib/features/search/presentation/widgets/search_chip_row.dart
import 'package:flutter/material.dart';
import 'package:tasks/core/utils/media_query_utils.dart';
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
    MediaQueryUtils.init(context);
    
    return Row(
      children: [
        SearchChipItem(
          title: titles[0],
          icon: icons[0],
        ),
        SizedBox(width: MediaQueryUtils.w(12)),
        SearchChipItem(
          title: titles[1],
          icon: icons[1],
        ),
      ],
    );
  }
=======
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
>>>>>>> ca8d16a5f8fdb0094cc2c7dc674066d5db562641
}