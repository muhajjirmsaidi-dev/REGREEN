import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class AdminCatalogScreen extends StatefulWidget {
  const AdminCatalogScreen({super.key});
  @override State<AdminCatalogScreen> createState() => _AdminCatalogScreenState();
}
class _AdminCatalogScreenState extends State<AdminCatalogScreen> {
  final Map<String, double> prices = {'Plastik PET Bening': 4200, 'Kardus & Karton': 2500, 'Logam & Kaleng': 7500};
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Katalog & Harga', style: TextStyle(fontWeight: FontWeight.w900)), leading: const BackButton()),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const Text('Update realtime indeks bank sampah', style: TextStyle(color: AppTheme.muted)),
      const SizedBox(height: 12),
      const Text('Margin Rata-rata Operasional', style: TextStyle(fontWeight: FontWeight.bold)),
      const Text('28,4%', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppTheme.green)),
      const SizedBox(height: 12),
      ...prices.keys.map((k) => _priceCard(k)),
      const SizedBox(height: 10),
      ElevatedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Semua harga disimpan.'))), icon: const Icon(Icons.sync), label: const Text('Simpan & Perbarui Semua Harga')),
    ]),
  );
  Widget _priceCard(String name) {
    final controller = TextEditingController(text: prices[name]!.toStringAsFixed(0));
    return Card(margin: const EdgeInsets.only(bottom: 10), child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [const Icon(Icons.recycling, color: AppTheme.green), const SizedBox(width: 8), Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w900))), Switch(value: true, onChanged: (_) {})]),
      TextField(controller: controller, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Harga beli warga per kg', prefixText: 'Rp ')),
      const SizedBox(height: 8),
      Text('Harga beli warga: Rp ${prices[name]!.toStringAsFixed(0)} /kg', style: const TextStyle(color: AppTheme.green)),
    ])));
  }
}
