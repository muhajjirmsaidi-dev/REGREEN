
import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../widgets/bottom_nav.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              _stat('Total Setor', '124 kg'),
              _stat('Selesai', '14 kali'),
              _stat('Pendapatan', 'Rp 498,5k'),
            ],
          ),

          const SizedBox(height: 16),

          _history(
            'AREG-20240527-09',
            'Kertas & Kardus',
            '14,8 kg',
            'Rp 55.500',
            'Masih dalam proses',
            false,
          ),

          _history(
            'AREG-20240524-03',
            'Kertas & Kardus',
            '12,5 kg',
            'Rp 37.500',
            'Sudah dikonfirmasi',
            true,
          ),

          _history(
            'AREG-20240519-11',
            'Plastik PET',
            '8,2 kg',
            'Rp 34.440',
            'Sudah dikonfirmasi',
            true,
          ),
        ],
      ),

      bottomNavigationBar: const NasabahBottomNav(
        currentIndex: 3,
      ),
    );
  }

  Widget _stat(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppTheme.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _history(
    String id,
    String type,
    String weight,
    String price,
    String status,
    bool done,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  id,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Chip(
                  label: Text(status),
                  backgroundColor: done
                      ? AppTheme.softGreen
                      : Colors.orange.shade50,
                ),
              ],
            ),

            const Divider(),

            Text(
              type,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              '$weight  •  $price',
              style: const TextStyle(
                color: AppTheme.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

