import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite/models/chapter.dart';
import 'package:sqlite/screens/chapter_screen.dart';

import '../database.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEEF5FF),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Center(
                  child: Text(
                    'আল হাদিস (الحديث)',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Book>>(
                  future: Get.find<AppDatabase>().getBooks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final books = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return _buildBookTile(book, index, context);
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookTile(Book book, int index, context) {
    return GestureDetector(
      onTap: () async {
        final chaptersData =
            await Get.find<AppDatabase>().getChaptersForBook(book.id);
        final chapters = chaptersData.map((chapterData) {
          return Chapter(
            id: chapterData.id,
            chapterId: chapterData.chapterId,
            bookId: chapterData.bookId,
            title: chapterData.title,
            number: chapterData.number,
            hadisRange: chapterData.hadisRange,
            bookName: chapterData.bookName,
          );
        }).toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChapterPage(book, chapters),
          ),
        );
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: 1.0,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 26, 164, 131),
                  Color.fromARGB(255, 0, 105, 92)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        book.titleAr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'হাদিস সংখ্যাঃ ${book.numberOfHadis}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
