import 'package:flutter/material.dart';
import 'package:web/features/home_page.dart';

import 'utils/res/app_color.dart';

void main() {
  runApp(const CanteenWebApp());
}

class CanteenWebApp extends StatelessWidget {
  const CanteenWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sushil Kumar Sharma Canteens',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.lightBg,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2,
          foregroundColor: AppColors.darkBrown,
        ),
      ),
      home: const HomePage(),
    );
  }
}
