// hadith_page.dart

import 'package:flutter/material.dart';
import 'package:sqlite/data/database/database.dart';
import 'package:sqlite/data/models/chapter.dart';
import 'package:sqlite/data/models/hadith.dart';

import '../widgets/hadith_list.dart';

class HadithPage extends StatelessWidget {
  final Chapter chapter;
  final Book book;
  final List<Hadith> hadiths;

  const HadithPage(
    this.chapter,
    this.hadiths,
    this.book, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: const Color(0xFF1AA483),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(),
              ),
              title: Row(
                children: [
                  Text(book.title),
                  Text(chapter.title),
                ],
              ),
              floating: true,
              snap: true,
              pinned: false,
              expandedHeight: 56.0, // Appbar Height
              flexibleSpace: const FlexibleSpaceBar(),
            ),
            HadithList(hadiths: hadiths, abvrCode: book.abvrCode),
          ],
        ),
      ),
    );
  }
}
