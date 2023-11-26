import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite/data/models/hadith.dart';
import 'package:sqlite/ui/screens/hadith_screen.dart';

import '../../data/database/database.dart';
import '../../data/models/chapter.dart';

class ChapterPage extends StatelessWidget {
  final Book book;
  final List<Chapter> chapters;

  const ChapterPage(this.book, this.chapters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 164, 131),
                Color.fromARGB(255, 0, 105, 92)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitalize(book.title),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), // title
                Text(
                  'হাদিস সংখ্যাঃ ${book.numberOfHadis}',
                  style: const TextStyle(fontSize: 15),
                ), // subtitle
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFFEEF5FF),
        child: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            final chapter = chapters[index];
            return _buildChapterCard(context, chapter, index);
          },
        ),
      ),
    );
  }

  Widget _buildChapterCard(BuildContext context, Chapter chapter, int index) {
    return GestureDetector(
      onTap: () async {
        final hadiths =
            (await Get.find<AppDatabase>().getHadithsForChapter(chapter.id))
                .map((hadithData) => Hadith(
                      id: (hadithData as HadithData).id,
                      bookId: hadithData.bookId,
                      bookName: hadithData.bookName,
                      chapterId: hadithData.chapterId,
                      sectionId: hadithData.sectionId,
                      hadithKey: hadithData.hadithKey,
                      hadithId: hadithData.hadithId,
                      narrator: hadithData.narrator ?? '',
                      bn: hadithData.bn ?? '',
                      ar: hadithData.ar ?? '',
                      arDiacless: hadithData.arDiacless ?? '',
                      note: hadithData.note ?? '',
                      gradeId: hadithData.gradeId ?? 0,
                      grade: hadithData.grade ?? '',
                      gradeColor: hadithData.gradeColor ?? '',
                      // ... (rest of your mapping logic)
                    ))
                .toList();

        Get.to(() => HadithPage(chapter, hadiths, book));
      },
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 26, 164, 131),
                    Color.fromARGB(255, 0, 105, 92)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          title: Text(
            chapter.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Hadith Range: ${chapter.hadisRange}'),
          trailing: const Icon(CupertinoIcons.arrow_right_circle),
        ),
      ),
    );
  }

  String capitalize(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }
}
