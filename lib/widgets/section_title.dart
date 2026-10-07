import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;

  const SectionTitle({
    super.key,
    required this.title,
    this.action,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppTheme.textDark)),
        if (action != null)
          TextButton(onPressed: onAction, child: Text(action!, style: const TextStyle(color: AppTheme.green))),
      ],
    );
  }
}
