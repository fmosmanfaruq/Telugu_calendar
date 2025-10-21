import 'package:flutter/material.dart';
import 'package:telugu_calender/core/config/app_theme.dart';
import 'package:telugu_calender/features/main_scaffold/screens/main_scaffold.dart';

class TeluguCalendarApp extends StatelessWidget {
  const TeluguCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telugu Calendar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScaffold(),
    );
  }
}
