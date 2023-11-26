import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite/database.dart';

import '../models/chapter.dart';
import '../models/hadith.dart';
import 'widgets/custompaint.dart';

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

  Color _getColorFromHex(String hexColorCode) {
    hexColorCode = hexColorCode.replaceAll("#", "");
    int hexValue = int.parse(hexColorCode, radix: 16);
    return Color(hexValue | 0xFF000000);
  }

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
              title: Text('Hadiths for ${chapter.title}'),
              floating: true,
              snap: true,
              pinned: false,
              expandedHeight: 56.0, // Appbar Height
              flexibleSpace: const FlexibleSpaceBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final hadith = hadiths[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        CustomPaint(
                                          size: const Size(50, 50),
                                          painter: RPSCustomPainter(),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Center(
                                            child: Text(
                                              book.abvrCode,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Hadith No: ',
                                                style: GoogleFonts.lato(
                                                  color:
                                                      const Color(0xFF5D646F),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '${index + 1}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF1AA483),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          hadith.bookName,
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF353535)
                                                .withOpacity(.5),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          5.sp, 4.sp, 5.sp, 4.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13.sp),
                                        color:
                                            _getColorFromHex(hadith.gradeColor),
                                      ),
                                      child: Center(
                                        child: Text(
                                          hadith.grade,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            color: Colors
                                                .white, // Set the text color as needed
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _showCustomBottomSheet(context);
                                      },
                                      icon: Icon(
                                        Icons.more_vert_outlined,
                                        color: const Color(0XFF353535)
                                            .withOpacity(.3),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  hadith.ar,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      height: 2,
                                      wordSpacing: 8,
                                      fontFamily: 'me_quran',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.sp,
                                      color: const Color(0xFF353535)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'It is narrated from ${hadith.narrator} (may Allaah have mercy on him): ',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF1AA483),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  hadith.bn,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF353535),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: hadiths.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More Option',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: const Color(0xFF35414D)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                _buildBottomSheetButton(
                    'Go To Main Hadith', Icons.telegram_sharp),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton(
                    'Add to Collection', Icons.bookmark_outline_outlined),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('Bangla Copy', Icons.copy),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('English Copy', Icons.copy),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('Arabic Copy', Icons.copy),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('Add Hifz', Icons.add_box),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('Add Note', Icons.add_box),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('Share', Icons.share_outlined),
                const SizedBox(height: 6.0),
                _buildBottomSheetButton('Report', Icons.report_outlined),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetButton(
    String title,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF1AA483),
            ),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: const Color(0xFF5D646F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
