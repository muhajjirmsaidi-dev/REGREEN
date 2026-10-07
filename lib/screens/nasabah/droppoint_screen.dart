import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../widgets/bottom_nav.dart';

class DropPointScreen extends StatelessWidget {
  const DropPointScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Drop Point', style: TextStyle(fontWeight: FontWeight.w900))),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      const SearchBar(hintText: 'Cari bank sampah atau drop point terdekat'),
      const SizedBox(height: 14),
      Container(height: 260, decoration: BoxDecoration(color: const Color(0xFFDDEFD8), borderRadius: BorderRadius.circular(20)), child: const Stack(children: [
        Center(child: Icon(Icons.map, size: 100, color: AppTheme.green)),
        Positioned(left: 80, top: 80, child: Icon(Icons.location_on, color: AppTheme.green, size: 40)),
        Positioned(right: 75, bottom: 65, child: Icon(Icons.location_on, color: Colors.red, size: 42)),
      ])),
      const SizedBox(height: 16),
      const Text('Bank Sampah Terdekat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
      _place('Bank Sampah Jati Metro', '1,2 km', 'Jln. Tufus ujung RT 07'),
      _place('REGREEN Eco Hub Kalumata', '2,4 km', 'Kalumata, Kota Ternate'),
    ]),
    bottomNavigationBar: const NasabahBottomNav(currentIndex: 4),
  );
  Widget _place(String name, String dist, String addr) => Card(child: ListTile(leading: const CircleAvatar(backgroundColor: AppTheme.lightGreen, child: Icon(Icons.recycling, color: AppTheme.green)), title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('$addr\\n$dist dari lokasi Anda'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Rute'))));
}
