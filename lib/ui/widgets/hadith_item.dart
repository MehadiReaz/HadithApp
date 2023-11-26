// hadith_item.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqlite/data/models/hadith.dart';
import 'package:sqlite/ui/widgets/custompaint.dart';

class HadithItem extends StatelessWidget {
  final Hadith hadith;
  final String abvrCode;

  const HadithItem({
    required this.hadith,
    required this.abvrCode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  _buildBookCode(abvrCode),
                  const SizedBox(width: 5),
                  _buildHadithInfo(),
                  const Spacer(),
                  _buildGradeIndicator(hadith.gradeColor, hadith.grade),
                  _buildMoreOptions(context),
                ],
              ),
              _buildArabicText(hadith.ar),
              const SizedBox(height: 10),
              _buildNarratorInfo(hadith.narrator),
              const SizedBox(height: 5),
              _buildHadithText(hadith.bn),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookCode(String abvrCode) {
    return Stack(
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
              abvrCode,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHadithInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRichText('Hadith No: ', '${hadith.id}'),
        Text(
          hadith.bookName,
          style: GoogleFonts.inter(
            color: const Color(0xFF353535).withOpacity(.5),
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildRichText(String prefix, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: prefix,
            style: GoogleFonts.lato(
              color: const Color(0xFF5D646F),
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: const Color(0xFF1AA483),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGradeIndicator(String color, String grade) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.sp, 4.sp, 5.sp, 4.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
        color: _getColorFromHex(color),
      ),
      child: Center(
        child: Text(
          grade,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMoreOptions(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showCustomBottomSheet(context);
      },
      icon: Icon(
        Icons.more_vert_outlined,
        color: const Color(0XFF353535).withOpacity(.3),
      ),
    );
  }

  Widget _buildArabicText(String text) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        height: 2,
        wordSpacing: 8,
        fontFamily: 'me_quran',
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        color: const Color(0xFF353535),
      ),
    );
  }

  Widget _buildNarratorInfo(String narrator) {
    return Text(
      'It is narrated from $narrator (may Allaah have mercy on him): ',
      style: GoogleFonts.inter(
        color: const Color(0xFF1AA483),
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildHadithText(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: GoogleFonts.inter(
        color: const Color(0xFF353535),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    // Function to show bottom sheet
  }

  Color _getColorFromHex(String hexColorCode) {
    hexColorCode = hexColorCode.replaceAll("#", "");
    int hexValue = int.parse(hexColorCode, radix: 16);
    return Color(hexValue | 0xFF000000);
  }
}
