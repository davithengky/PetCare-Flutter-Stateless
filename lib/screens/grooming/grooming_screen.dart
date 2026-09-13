import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class GroomingScreen extends StatelessWidget {
  const GroomingScreen({super.key});

  static const services = [
    {'name': 'Mandi', 'price': 'Rp50.000'},
    {'name': 'Potong Kuku', 'price': 'Rp20.000'},
    {'name': 'Haircut', 'price': 'Rp75.000'},
    {'name': 'Grooming Lengkap', 'price': 'Rp150.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grooming')),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: services.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada layanan grooming',
                      style: TextStyle(
                          fontSize: 14, color: AppColors.textGrey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          leading: const CircleAvatar(
                            radius: 26,
                            backgroundColor: AppColors.secondary,
                            child: Icon(Icons.content_cut,
                                color: Colors.white, size: 24),
                          ),
                          title: Text(
                            service['name']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textDark,
                            ),
                          ),
                          subtitle: Text(
                            service['price']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Booking grooming "${service['name']}" berhasil'),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(76, 36),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: const Text('Pilih'),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}