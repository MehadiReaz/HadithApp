// hadith_list.dart

import 'package:flutter/material.dart';
import 'package:sqlite/models/hadith.dart';
import 'hadith_item.dart';

class HadithList extends StatelessWidget {
  final List<Hadith> hadiths;
  final String abvrCode;

  const HadithList({
    super.key,
    required this.hadiths,
    required this.abvrCode,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final hadith = hadiths[index];
          return HadithItem(
            hadith: hadith,
            abvrCode: abvrCode,
          );
        },
        childCount: hadiths.length,
      ),
    );
  }
}
