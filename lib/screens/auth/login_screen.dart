import 'package:flutter/material.dart';
import '../../core/app_routes.dart';
import '../../core/app_theme.dart';
import '../../widgets/regreen_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String role = 'Nasabah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 35, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: RegreenLogo(size: 70)),
              const SizedBox(height: 18),
              const Center(child: Text('Selamat Datang Kembali', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900))),
              const SizedBox(height: 6),
              const Center(child: Text('Masuk untuk kelola tabungan sampah,\\npenjemputan dan operasional bank sampah.', textAlign: TextAlign.center)),
              const SizedBox(height: 22),
              const Text('Pilih Peran Akun', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              Row(
                children: [
                  _role('Nasabah', Icons.person),
                  const SizedBox(width: 10),
                  _role('Mitra Kurir', Icons.local_shipping),
                  const SizedBox(width: 10),
                  _role('Admin', Icons.admin_panel_settings),
                ],
              ),
              const SizedBox(height: 18),
              TextField(decoration: const InputDecoration(labelText: 'Email atau Nomor WhatsApp', prefixIcon: Icon(Icons.person_outline))),
              const SizedBox(height: 12),
              TextField(obscureText: true, decoration: const InputDecoration(labelText: 'Kata Sandi', prefixIcon: Icon(Icons.lock_outline))),
              const SizedBox(height: 10),
              Row(children: [Checkbox(value: true, onChanged: (_) {}), const Text('Ingat Saya di Perangkat Ini')]),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (role == 'Nasabah') Navigator.pushReplacementNamed(context, AppRoutes.home);
                    if (role == 'Mitra Kurir') Navigator.pushReplacementNamed(context, AppRoutes.mitraHome);
                    if (role == 'Admin') Navigator.pushReplacementNamed(context, AppRoutes.admin);
                  },
                  child: const Text('Masuk ke Aplikasi REGREEN'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(child: Text('— ATAU MASUK LEBIH CEPAT —')),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata), label: const Text('Google'))),
                  const SizedBox(width: 10),
                  Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.facebook), label: const Text('Facebook'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _role(String label, IconData icon) {
    final active = role == label;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => role = label),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          decoration: BoxDecoration(
            color: active ? AppTheme.green : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: active ? AppTheme.green : Colors.grey.shade300),
          ),
          child: Column(children: [Icon(icon, color: active ? Colors.white : AppTheme.green), const SizedBox(height: 4), Text(label, style: TextStyle(fontSize: 11, color: active ? Colors.white : AppTheme.textDark))]),
        ),
      ),
    );
  }
}
