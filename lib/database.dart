import 'dart:io';
import 'dart:developer';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart' show rootBundle;
import 'tables.dart';
part 'database.g.dart';

@DriftDatabase(tables: [Books, Chapter, Hadith, Section])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'hadith_bn_test.db'));

      if (!await file.exists()) {
        // Extract the pre-populated database file from assets
        final blob = await rootBundle.load('assets/hadith_bn_test.db');
        final buffer = blob.buffer;
        await file.writeAsBytes(
            buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
      }

      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  int get schemaVersion => 1;
  Future<List<Book>> getBooks() async {
    try {
      final result = await (select(books).get());

      if (result.isNotEmpty) {
        return result.map((e) => e).toList();
      } else {
        log('Error: Result is null');
        return [];
      }
    } catch (e, stackTrace) {
      log('Error fetching books: $e\n$stackTrace');
      return [];
    }
  }

  Future<List<ChapterData>> getChaptersForBook(int bookId) async {
    try {
      final result = await (select(chapter)
            ..where((tbl) => tbl.bookId.equals(bookId)))
          .get();

      if (result.isNotEmpty) {
        return result.map((e) => e).toList();
      } else {
        log('Error: Result is null');
        return [];
      }
    } catch (e, stackTrace) {
      log('Error fetching chapters: $e\n$stackTrace');
      return [];
    }
  }

  Future<List<Object>> getHadithsForChapter(int chapterId) async {
    try {
      final result = await (select(hadith)
            ..where((hadith) => hadith.chapterId.equals(chapterId)))
          .get();

      if (result.isNotEmpty) {
        return result.map((e) => e).toList();
      } else {
        log('Error: Result is null');
        return [];
      }
    } catch (e, stackTrace) {
      log('Error fetching hadiths: $e\n$stackTrace');
      return [];
    }
  }

  Future<List<SectionData>> getSectionsForChapter(int chapterId) async {
    try {
      final result = await (select(section)
            ..where((tbl) => tbl.chapterId.equals(chapterId)))
          .get();

      if (result.isNotEmpty) {
        return result.map((e) => e).toList();
      } else {
        print('Error: Result is null');
        return [];
      }
    } catch (e, stackTrace) {
      print('Error fetching sections: $e\n$stackTrace');
      return [];
    }
  }
}
