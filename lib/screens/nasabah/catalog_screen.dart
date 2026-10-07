import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../widgets/bottom_nav.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Katalog Jenis Sampah', style: TextStyle(fontWeight: FontWeight.w900)), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))]),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('Panduan nilai sampah', style: TextStyle(color: AppTheme.muted)),
        const SizedBox(height: 10),
        const SearchBar(hintText: 'Cari jenis sampah, contoh: botol PET, kardus...'),
        const SizedBox(height: 14),
        Wrap(spacing: 8, children: const [Chip(label: Text('Semua')), Chip(label: Text('Kertas')), Chip(label: Text('Plastik')), Chip(label: Text('Logam')), Chip(label: Text('Kaca'))]),
        const SizedBox(height: 14),
        _item('Kertas & Kardus', 'Kardus, HVS, koran, majalah', 'Rp 2.500 - Rp 3.800 /kg', Icons.inventory_2),
        _item('Plastik PET Bening', 'Botol plastik bening bersih', 'Rp 4.200 /kg', Icons.local_drink),
        _item('Logam & Kaleng', 'Kaleng minuman dan besi', 'Rp 7.500 /kg', Icons.settings),
      ]),
      bottomNavigationBar: const NasabahBottomNav(currentIndex: 2),
    );
  }

  Widget _item(String title, String sub, String price, IconData icon) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
      Container(width: 74, height: 74, decoration: BoxDecoration(color: AppTheme.lightGreen, borderRadius: BorderRadius.circular(12)), child: Icon(icon, size: 38, color: AppTheme.green)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w900)), Text(sub, style: const TextStyle(color: AppTheme.muted)), const SizedBox(height: 4), Text(price, style: const TextStyle(color: AppTheme.green, fontWeight: FontWeight.w900))])),
      const Icon(Icons.arrow_forward_ios, size: 14),
    ])),
  );
}
