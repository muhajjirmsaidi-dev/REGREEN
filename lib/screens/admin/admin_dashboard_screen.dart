import 'package:flutter/material.dart';
import '../../core/app_routes.dart';
import '../../core/app_theme.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Admin Ternate', style: TextStyle(fontWeight: FontWeight.w900)), actions: [Chip(label: const Text('SUPERADMIN'))]),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(16)), child: const Row(children: [Icon(Icons.warning, color: Colors.red), SizedBox(width: 10), Expanded(child: Text('Tindakan Diperlukan Segera\\nAda 2 permintaan penarikan perlu diproses.'))])),
      const SizedBox(height: 14),
      GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 10, crossAxisSpacing: 10, children: const [
        _Metric('Sampah Terkumpul', '48.6 ton', Icons.recycling),
        _Metric('Order Jemput', '1.842', Icons.local_shipping),
        _Metric('Nasabah Aktif', '4.280', Icons.people),
        _Metric('Mitra Kurir', '24', Icons.delivery_dining),
      ]),
      const SizedBox(height: 18),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Akses Cepat Pengelolaan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)), TextButton(onPressed: () {}, child: const Text('Semua Menu'))]),
      _action(context, 'Kelola Harga Sampah', 'Sampah', AppRoutes.adminCatalog),
      _action(context, 'Verifikasi Tarik Saldo', 'Keuangan', AppRoutes.withdrawalVerification),
    ]),
    bottomNavigationBar: NavigationBar(destinations: const [NavigationDestination(icon: Icon(Icons.dashboard), label: 'Ringkasan'), NavigationDestination(icon: Icon(Icons.people), label: 'Pengguna'), NavigationDestination(icon: Icon(Icons.inventory), label: 'Katalog'), NavigationDestination(icon: Icon(Icons.account_balance_wallet), label: 'Keuangan'), NavigationDestination(icon: Icon(Icons.settings), label: 'Pengaturan')]),
  );
}
class _Metric extends StatelessWidget {
  final String a,b; final IconData icon;
  const _Metric(this.a,this.b,this.icon);
  @override Widget build(BuildContext c) => Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon,color: AppTheme.green), const Spacer(), Text(b,style: const TextStyle(fontSize:22,fontWeight:FontWeight.w900)), Text(a,style:const TextStyle(fontSize:11))])));
}
Widget _action(BuildContext c, String title, String sub, String route) => Card(child: ListTile(leading: const CircleAvatar(backgroundColor: AppTheme.lightGreen, child: Icon(Icons.settings, color: AppTheme.green)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(sub), trailing: const Icon(Icons.arrow_forward_ios, size: 14), onTap: () => Navigator.pushNamed(c, route)));
