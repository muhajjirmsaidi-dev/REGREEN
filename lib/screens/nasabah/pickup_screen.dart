import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/primary_button.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  String category = 'Kertas & Kardus';
  double kg = 15;
  DateTime? selectedDate;

  Future<void> pilihTanggal() async {
    final DateTime? tanggal = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 30),
      ),
      initialDate: DateTime.now(),
    );

    if (tanggal != null) {
      setState(() {
        selectedDate = tanggal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jemput Sampah',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'LANGKAH 1 DARI 2',
            style: TextStyle(
              color: AppTheme.green,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Formulir Jemput Sampah',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Text(
            'Konfirmasi sampah melalui rumah Anda.',
          ),

          const SizedBox(height: 18),

          // =========================
          // KATEGORI SAMPAH
          // =========================
          const Text(
            '1. Pilih Kategori Sampah',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              'Kertas & Kardus',
              'Plastik Daur Ulang',
              'Logam & Kaleng',
              'Jelantah & Kaca',
            ].map(
              (x) {
                return ChoiceChip(
                  label: Text(x),
                  selected: category == x,
                  onSelected: (_) {
                    setState(() {
                      category = x;
                    });
                  },
                );
              },
            ).toList(),
          ),

          const SizedBox(height: 20),

          // =========================
          // BERAT SAMPAH
          // =========================
          const Text(
            '2. Perkiraan Berat Sampah',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            kg = (kg - 1)
                                .clamp(1, 100)
                                .toDouble();
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                        ),
                      ),

                      Text(
                        '${kg.toInt()} KG',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            kg = (kg + 1)
                                .clamp(1, 100)
                                .toDouble();
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                        ),
                      ),
                    ],
                  ),

                  Slider(
                    value: kg,
                    min: 1,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        kg = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // =========================
          // TANGGAL
          // =========================
          const Text(
            '3. Jadwal Penjemputan',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),

          TextField(
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.calendar_month,
              ),
              labelText: selectedDate == null
                  ? 'Pilih tanggal'
                  : '${selectedDate!.day}/'
                    '${selectedDate!.month}/'
                    '${selectedDate!.year}',
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
              ),
            ),
            onTap: pilihTanggal,
          ),

          const SizedBox(height: 12),

          // =========================
          // ALAMAT
          // =========================
          const Text(
            '4. Lokasi Penjemputan',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),

          const TextField(
            maxLines: 2,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_on_outlined,
              ),
              hintText: 'Alamat penjemputan',
            ),
          ),

          const SizedBox(height: 18),

          // =========================
          // ESTIMASI SALDO
          // =========================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.softGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estimasi Saldo Masuk',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Rp 45.000',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.green,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // =========================
          // TOMBOL
          // =========================
          PrimaryButton(
            text: 'Lanjutkan Konfirmasi',
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    title: const Text('Berhasil'),
                    content: const Text(
                      'Permintaan penjemputan disimpan.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: const NasabahBottomNav(
        currentIndex: 1,
      ),
    );
  }
}