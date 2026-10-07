import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'core/app_routes.dart';

void main() {
  runApp(const RegreenApp());
}

class RegreenApp extends StatelessWidget {
  const RegreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REGREEN Bank Sampah',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
