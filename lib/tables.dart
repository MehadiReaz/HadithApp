import 'package:drift/drift.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get titleAr => text().withLength(min: 1, max: 50)();
  IntColumn get numberOfHadis => integer()();
  TextColumn get abvrCode => text().withLength(min: 1, max: 5)();
  TextColumn get bookName => text().withLength(min: 1, max: 50)();
  TextColumn get bookDescr => text().withLength(min: 1, max: 100)();
  TextColumn get colorCode => text().withLength(min: 1, max: 7)();
}

class Chapter extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId => integer()();
  IntColumn get bookId => integer()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  IntColumn get number => integer()();
  TextColumn get hadisRange => text().withLength(min: 1, max: 100)();
  TextColumn get bookName => text().withLength(min: 1, max: 50)();
}

class Hadith extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer()();
  TextColumn get bookName => text().withLength(min: 1, max: 50)();
  IntColumn get chapterId => integer()();
  IntColumn get sectionId => integer()();
  TextColumn get hadithKey => text().withLength(min: 1, max: 100)();
  IntColumn get hadithId => integer()();
  TextColumn get narrator => text().nullable()();
  TextColumn get bn => text().nullable()();
  TextColumn get ar => text().nullable()();
  TextColumn get arDiacless => text().nullable()();
  TextColumn get note => text().nullable()();
  IntColumn get gradeId => integer().nullable()();
  TextColumn get grade => text().nullable()();
  TextColumn get gradeColor => text().nullable()();
}

class Section extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer()();
  TextColumn get bookName => text().withLength(min: 1, max: 50)();
  IntColumn get chapterId => integer()();
  IntColumn get sectionId => integer()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get preface => text().nullable()();
  IntColumn get number => integer()();
  IntColumn get sortOrder => integer()();
}
