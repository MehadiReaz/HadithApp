class Book {
  final int id;
  final String title;
  final String title_ar;
  final int number_of_hadis;
  final String abvr_code;
  final String book_name;
  final String book_descr;
  final String color_code;

  Book({
    required this.id,
    required this.title,
    required this.title_ar,
    required this.number_of_hadis,
    required this.abvr_code,
    required this.book_name,
    required this.book_descr,
    required this.color_code,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      title: map['title'] as String,
      title_ar: map['title_ar'] as String,
      number_of_hadis: map['number_of_hadis'] as int,
      abvr_code: map['abvr_code'] as String,
      book_name: map['book_name'] as String,
      book_descr: map['book_descr'] as String,
      color_code: map['color_code'] as String,
    );
  }
}
