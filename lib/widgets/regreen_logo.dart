import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class RegreenLogo extends StatelessWidget {
  final double size;
  const RegreenLogo({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.lightGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(Icons.recycling_rounded, color: AppTheme.green, size: size * .6),
    );
  }
}
