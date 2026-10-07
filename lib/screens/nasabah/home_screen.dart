import 'package:flutter/material.dart';
import '../../core/app_routes.dart';
import '../../core/app_theme.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGREEN App', style: TextStyle(fontWeight: FontWeight.w900)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)), const CircleAvatar(child: Icon(Icons.person))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Halo, Rizky Pratama! 👋', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: AppTheme.green, borderRadius: BorderRadius.circular(20)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('TOTAL SALDO ANDA', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Rp 348.500', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total Sampah Terkumpul\\n124,5 kg', style: TextStyle(color: Colors.white)), Text('Poin Hijau\\n1.420 Poin', style: TextStyle(color: Colors.white))]),
              const SizedBox(height: 14),
              Row(children: [
                Expanded(child: OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, AppRoutes.wallet), icon: const Icon(Icons.account_balance_wallet), label: const Text('Tarik Saldo'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white))),
                const SizedBox(width: 8),
                Expanded(child: OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, AppRoutes.pickup), icon: const Icon(Icons.recycling), label: const Text('Setor Sampah'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white))),
              ]),
            ]),
          ),
          const SizedBox(height: 20),
          const SectionTitle(title: 'Layanan Cepat'),
          const SizedBox(height: 8),
          Row(children: [
            _quick(context, Icons.local_shipping, 'Jemput\\nSampah', AppRoutes.pickup),
            _quick(context, Icons.recycling, 'Jenis\\Sampah', AppRoutes.catalog),
            _quick(context, Icons.history, 'Riwayat\\nSetoran', AppRoutes.history),
            _quick(context, Icons.location_on, 'Drop Point', AppRoutes.dropPoint),
          ]),
          const SizedBox(height: 20),
          const SectionTitle(title: 'Edukasi Hari Ini', action: 'Lihat Semua'),
          Card(
            child: ListTile(
              leading: const Icon(Icons.eco, color: AppTheme.green, size: 40),
              title: const Text('Cara Tepat Memilah Sampah Plastik PET Agar...', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Pisahkan tutup botol dan lepaskan sisa label sebelum disetorkan.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            ),
          ),
          const SizedBox(height: 12),
          const SectionTitle(title: 'Aktivitas Terakhir', action: 'Lihat Semua'),
          _activity('Plastik Botol & Gelas', '12,5 kg', 'Rp 37.500'),
          _activity('Kertas & Kardus', '8,2 kg', 'Rp 20.500'),
        ],
      ),
      bottomNavigationBar: const NasabahBottomNav(currentIndex: 0),
    );
  }

  Widget _quick(BuildContext c, IconData icon, String label, String route) => Expanded(
    child: InkWell(onTap: () => Navigator.pushNamed(c, route), child: Column(children: [CircleAvatar(backgroundColor: AppTheme.lightGreen, child: Icon(icon, color: AppTheme.green)), const SizedBox(height: 5), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11))])),
  );

  Widget _activity(String title, String weight, String price) => Card(
    child: ListTile(leading: const CircleAvatar(backgroundColor: AppTheme.lightGreen, child: Icon(Icons.recycling, color: AppTheme.green)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(weight), trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.w900, color: AppTheme.green))),
  );
}
