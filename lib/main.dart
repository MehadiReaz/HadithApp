import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'data/database/database.dart';
import 'ui/screens/books_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppDatabase());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(primaryColor: const Color.fromARGB(1, 26, 164, 131)),
          debugShowCheckedModeBanner: false,
          home: const BooksScreen(),
        );
      },
    );
  }
}
