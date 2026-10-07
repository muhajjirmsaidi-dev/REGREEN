import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class RoutePickupScreen extends StatelessWidget {
  const RoutePickupScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Rute Antar #REG-0902', style: TextStyle(fontWeight: FontWeight.w900))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Card(child: ListTile(title: Text('1.4 km • 6 min', style: TextStyle(fontWeight: FontWeight.w900)), subtitle: Text('Perkiraan tiba 14:20'))),
      Container(height: 300, decoration: BoxDecoration(color: const Color(0xFFDDEFD8), borderRadius: BorderRadius.circular(20)), child: const Center(child: Icon(Icons.route, size: 120, color: AppTheme.green))),
      const SizedBox(height: 14),
      const Text('Proses Penjemputan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
      _step('Menjemput di Lokasi', true),
      _step('Timbang di Rumah', false),
      _step('Sampai Bank Sampah', false),
      const SizedBox(height: 12),
      const ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('Rizky Pratama'), subtitle: Text('Jl. Revo... RT 42, Kel. Kalumata, Kota Ternate')),
      ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.phone), label: const Text('Hubungi Nasabah')),
    ]),
  );
  Widget _step(String text, bool active) => ListTile(leading: CircleAvatar(backgroundColor: active ? AppTheme.green : Colors.grey.shade300, child: Icon(active ? Icons.check : Icons.circle, color: active ? Colors.white : Colors.grey)), title: Text(text));
}
