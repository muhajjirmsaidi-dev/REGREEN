import 'package:flutter/material.dart';
import '../../core/app_routes.dart';
import '../../core/app_theme.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Order Aktif #REG-0902', style: TextStyle(fontWeight: FontWeight.w900))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Rizky Pratama', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), Chip(label: const Text('Menuju Lokasi'))]),
      const SizedBox(height: 14),
      Card(child: ListTile(leading: const Icon(Icons.route, color: AppTheme.green), title: const Text('1.4 km • 6 min'), subtitle: const Text('Perkiraan tiba 14:20'), trailing: ElevatedButton(onPressed: () => Navigator.pushNamed(context, AppRoutes.routePickup), child: const Text('Buka Maps')))),
      const SizedBox(height: 14),
      const Text('Timbangan Digital Portable', style: TextStyle(fontWeight: FontWeight.w900)),
      _material('Kardus & Karton Tebal', '14.8 KG', 'Rp 44.400'),
      _material('Botol Plastik PET Bening', '4.2 KG', 'Rp 17.640'),
      const SizedBox(height: 14),
      const Text('Foto Bukti Lapangan', style: TextStyle(fontWeight: FontWeight.w900)),
      Container(height: 130, decoration: BoxDecoration(color: AppTheme.lightGreen, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.photo_library, size: 55, color: AppTheme.green)),
      const SizedBox(height: 18),
      ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.check_circle), label: const Text('Selesaikan Penjemputan')),
    ]),
  );
  Widget _material(String a, String b, String c) => Card(child: ListTile(title: Text(a, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(b), trailing: Text(c, style: const TextStyle(fontWeight: FontWeight.w900, color: AppTheme.green))));
}
