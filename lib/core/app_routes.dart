import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/nasabah/home_screen.dart';
import '../screens/nasabah/pickup_screen.dart';
import '../screens/nasabah/catalog_screen.dart';
import '../screens/nasabah/wallet_screen.dart';
import '../screens/nasabah/history_screen.dart';
import '../screens/nasabah/droppoint_screen.dart';
import '../screens/mitra/mitra_home_screen.dart';
import '../screens/mitra/order_detail_screen.dart';
import '../screens/mitra/route_pickup_screen.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/admin_catalog_screen.dart';
import '../screens/admin/withdrawal_verification_screen.dart';

class AppRoutes {
  static const login = '/';
  static const home = '/nasabah/home';
  static const pickup = '/nasabah/pickup';
  static const catalog = '/nasabah/catalog';
  static const wallet = '/nasabah/wallet';
  static const history = '/nasabah/history';
  static const dropPoint = '/nasabah/drop-point';

  static const mitraHome = '/mitra/home';
  static const orderDetail = '/mitra/order-detail';
  static const routePickup = '/mitra/route';

  static const admin = '/admin';
  static const adminCatalog = '/admin/catalog';
  static const withdrawalVerification = '/admin/withdrawal';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => const LoginScreen(),
        home: (_) => const HomeScreen(),
        pickup: (_) => const PickupScreen(),
        catalog: (_) => const CatalogScreen(),
        wallet: (_) => const WalletScreen(),
        history: (_) => const HistoryScreen(),
        dropPoint: (_) => const DropPointScreen(),
        mitraHome: (_) => const MitraHomeScreen(),
        orderDetail: (_) => const OrderDetailScreen(),
        routePickup: (_) => const RoutePickupScreen(),
        admin: (_) => const AdminDashboardScreen(),
        adminCatalog: (_) => const AdminCatalogScreen(),
        withdrawalVerification: (_) => const WithdrawalVerificationScreen(),
      };
}
