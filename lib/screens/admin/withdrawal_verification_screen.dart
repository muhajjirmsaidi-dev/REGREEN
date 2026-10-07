
import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class WithdrawalVerificationScreen extends StatelessWidget {
  const WithdrawalVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Antrian Admin Online',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'TOTAL DANA SIAP CAIR',
            style: TextStyle(
              color: AppTheme.muted,
            ),
          ),

          const Text(
            'Rp 450.000',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: AppTheme.green,
            ),
          ),

          const SizedBox(height: 14),

          _request(
            context,
            'Rizky Pratama',
            'Rp 150.000',
            'BCA',
            true,
          ),

          _request(
            context,
            'Siti Aisyah',
            'Rp 200.000',
            'Mandiri',
            false,
          ),
        ],
      ),
    );
  }

  Widget _request(
    BuildContext context,
    String name,
    String amount,
    String bank,
    bool selected,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                Text(
                  amount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppTheme.green,
                  ),
                ),
              ],
            ),

            const Divider(),

            Text(
              'Nominal Penarikan: $amount',
            ),

            Text(
              'Bank tujuan: $bank',
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Tolak'),
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _confirm(
                        context,
                        name,
                      );
                    },
                    child: const Text(
                      'Setujui & Transfer',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirm(
    BuildContext context,
    String name,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Berhasil',
          ),

          content: Text(
            'Penarikan $name disetujui dan masuk proses transfer.',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
}

