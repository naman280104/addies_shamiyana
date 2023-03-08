import 'package:addies_shamiyana/src/features/authentication/screens/loading/loading.dart';
import 'package:addies_shamiyana/src/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: AppTheme.lightTheme,
      home: Loading(),
    );
  }
}
