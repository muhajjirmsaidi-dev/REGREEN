import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});
  @override State<WalletScreen> createState() => _WalletScreenState();
}
class _WalletScreenState extends State<WalletScreen> {
  String nominal = 'Rp 150.000';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Tarik Saldo', style: TextStyle(fontWeight: FontWeight.w900))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: AppTheme.green, borderRadius: BorderRadius.circular(18)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('TOTAL SALDO ANDA SAAT INI', style: TextStyle(color: Colors.white70)), Text('Rp 348.500', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)), Text('Batas minimum penarikan Rp 20.000', style: TextStyle(color: Colors.white70))])),
      const SizedBox(height: 18),
      const Text('Pilih Nominal Cepat', style: TextStyle(fontWeight: FontWeight.w900)),
      const SizedBox(height: 10),
      Wrap(spacing: 10, runSpacing: 10, children: ['Rp 50.000','Rp 100.000','Rp 150.000','Rp 200.000','Rp 250.000','Tarik Semua'].map((x) => ChoiceChip(label: Text(x), selected: nominal == x, onSelected: (_) => setState(() => nominal = x))).toList()),
      const SizedBox(height: 18),
      const Text('Atau Masukkan Nominal Manual', style: TextStyle(fontWeight: FontWeight.w900)),
      const SizedBox(height: 8),
      TextField(controller: TextEditingController(text: nominal), keyboardType: TextInputType.number, decoration: const InputDecoration(prefixText: 'Rp ')),
      const SizedBox(height: 18),
      const Text('Rekening Tujuan Pencairan', style: TextStyle(fontWeight: FontWeight.w900)),
      const SizedBox(height: 8),
      _bank('Bank Central Asia (BCA)', '8290•••••••••••', true),
      _bank('Bank Mandiri', '1400•••••••••••', false),
      const SizedBox(height: 18),
      SizedBox(height: 50, child: ElevatedButton.icon(onPressed: () => _submit(context), icon: const Icon(Icons.account_balance), label: const Text('Ajukan Penarikan'))),
    ]),
  );
  Widget _bank(String name, String number, bool selected) => Card(child: ListTile(leading: const Icon(Icons.account_balance), title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(number), trailing: Radio(value: selected, groupValue: true, onChanged: (_) {})));
  void _submit(BuildContext c) => showDialog(context: c, builder: (_) => AlertDialog(title: const Text('Permintaan dikirim'), content: Text('Penarikan $nominal menunggu verifikasi admin.'), actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('OK'))]));
}
