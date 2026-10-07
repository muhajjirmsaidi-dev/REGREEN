import 'package:flutter/material.dart';
import '../core/app_routes.dart';
import '../core/app_theme.dart';

class NasabahBottomNav extends StatelessWidget {
  final int currentIndex;
  const NasabahBottomNav({super.key, required this.currentIndex});

  void _go(BuildContext context, int index) {
    final routes = [
      AppRoutes.home,
      AppRoutes.pickup,
      AppRoutes.catalog,
      AppRoutes.history,
      AppRoutes.dropPoint,
    ];
    if (index == currentIndex) return;
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (i) => _go(context, i),
      backgroundColor: Colors.white,
      indicatorColor: AppTheme.lightGreen,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Beranda'),
        NavigationDestination(icon: Icon(Icons.local_shipping_outlined), selectedIcon: Icon(Icons.local_shipping), label: 'Jemput'),
        NavigationDestination(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront), label: 'Katalog'),
        NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'Riwayat'),
        NavigationDestination(icon: Icon(Icons.location_on_outlined), selectedIcon: Icon(Icons.location_on), label: 'Drop Point'),
      ],
    );
  }
}
