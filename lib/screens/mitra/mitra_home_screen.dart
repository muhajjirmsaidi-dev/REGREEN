import 'package:flutter/material.dart';
import '../../core/app_routes.dart';
import '../../core/app_theme.dart';

class MitraHomeScreen extends StatelessWidget {
  const MitraHomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('REGREEN Mitra', style: TextStyle(fontWeight: FontWeight.w900)), actions: [const CircleAvatar(child: Icon(Icons.person)), const SizedBox(width: 8)]),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Text('Ahmad Fauzi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
      const Text('Mitra Kurir • Online'),
      const SizedBox(height: 14),
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppTheme.green, borderRadius: BorderRadius.circular(18)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('PENDAPATAN BERSIH HARI INI', style: TextStyle(color: Colors.white70)), Text('Rp 145.000', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)), Text('Target hari ini 8/12 selesai', style: TextStyle(color: Colors.white))])),
      const SizedBox(height: 18),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Order Masuk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)), Text('3 tersedia', style: TextStyle(color: AppTheme.green, fontWeight: FontWeight.bold))]),
      _order(context, 'Pintu Baru', '1,2 km', 'Kardus & Botol PET Bening'),
      _order(context, 'Pak Ruslan', '2,8 km', 'Kaleng Aluminium & Besi Tipis'),
    ]),
    bottomNavigationBar: NavigationBar(destinations: const [NavigationDestination(icon: Icon(Icons.list), label: 'Tugas'), NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Riwayat'), NavigationDestination(icon: Icon(Icons.person), label: 'Profil')]),
  );
  Widget _order(BuildContext c, String title, String distance, String item) => Card(child: Padding(padding: const EdgeInsets.all(14), child: Column(children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w900)), Text(distance)]),
    Align(alignment: Alignment.centerLeft, child: Text(item)),
    const SizedBox(height: 10),
    Row(children: [Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Tolak'))), const SizedBox(width: 8), Expanded(child: ElevatedButton(onPressed: () => Navigator.pushNamed(c, AppRoutes.orderDetail), child: const Text('Terima Order')))]),
  ])));
}
