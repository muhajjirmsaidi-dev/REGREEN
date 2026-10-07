# flutter_application_1

A new Flutter project.

lib/
├── main.dart
├── core/
│   ├── app_routes.dart
│   └── app_theme.dart
├── models/
├── widgets/
│   ├── bottom_nav.dart
│   ├── primary_button.dart
│   ├── regreen_logo.dart
│   └── section_title.dart
└── screens/
    ├── auth/
    │   └── login_screen.dart
    ├── nasabah/
    │   ├── home_screen.dart
    │   ├── pickup_screen.dart
    │   ├── catalog_screen.dart
    │   ├── wallet_screen.dart
    │   ├── history_screen.dart
    │   └── droppoint_screen.dart
    ├── mitra/
    │   ├── mitra_home_screen.dart
    │   ├── order_detail_screen.dart
    │   └── route_pickup_screen.dart
    └── admin/
        ├── admin_dashboard_screen.dart
        ├── admin_catalog_screen.dart
        └── withdrawal_verification_screen.dart

## Pemetaan desain

1. Login / pilih peran -> screens/auth/login_screen.dart
2. Nasabah beranda -> screens/nasabah/home_screen.dart
3. Form jemput sampah -> screens/nasabah/pickup_screen.dart
4. Katalog jenis sampah -> screens/nasabah/catalog_screen.dart
5. Tarik saldo -> screens/nasabah/wallet_screen.dart
6. Riwayat -> screens/nasabah/history_screen.dart
7. Drop point -> screens/nasabah/droppoint_screen.dart
8. Login kedua pada dokumen -> memakai login_screen.dart
9. Dashboard kurir/mitra -> screens/mitra/mitra_home_screen.dart
10. Detail order mitra -> screens/mitra/order_detail_screen.dart
11. Rute penjemputan -> screens/mitra/route_pickup_screen.dart
12. Dashboard admin -> screens/admin/admin_dashboard_screen.dart
13. Katalog & harga admin -> screens/admin/admin_catalog_screen.dart
14. Verifikasi tarik saldo -> screens/admin/withdrawal_verification_screen.dart

## Cara menjalankan

1. Buat project Flutter:
   flutter create regreen

2. Ganti folder `lib/` project dengan folder `lib/` dari paket ini.
3. Ganti `pubspec.yaml`.
4. Jalankan:
   flutter pub get
   flutter run

Kode ini adalah UI prototype. Data masih dummy/local; belum terhubung database, API, Google Maps, WhatsApp, payment gateway, atau backend.
