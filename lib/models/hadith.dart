class Hadith {
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String hadithKey;
  final int hadithId;
  final String narrator;
  final String bn;
  final String ar;
  final String arDiacless;
  final String note;
  final int gradeId;
  final String grade;
  final String gradeColor;

  Hadith({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.hadithKey,
    required this.hadithId,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    required this.note,
    required this.gradeId,
    required this.grade,
    required this.gradeColor,
  });

  factory Hadith.fromMap(Map<String, dynamic> map) {
    return Hadith(
      id: map['id'] as int,
      bookId: map['book_id'] as int,
      bookName: map['book_name'] as String,
      chapterId: map['chapter_id'] as int,
      sectionId: map['section_id'] as int,
      hadithKey: map['hadith_key'] as String,
      hadithId: map['hadith_id'] as int,
      narrator: map['narrator'] as String,
      bn: map['bn'] as String,
      ar: map['ar'] as String,
      arDiacless: map['ar_diacless'] as String,
      note: map['note'] as String,
      gradeId: map['grade_id'] as int,
      grade: map['grade'] as String,
      gradeColor: map['grade_color'] as String,
    );
  }
}
