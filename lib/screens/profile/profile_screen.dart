import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'icon': Icons.person_outline, 'label': 'Data Pengguna'},
      {'icon': Icons.pets_outlined, 'label': 'Data Pet'},
      {'icon': Icons.location_on_outlined, 'label': 'Alamat'},
      {'icon': Icons.payment_outlined, 'label': 'Metode Pembayaran'},
      {'icon': Icons.notifications_outlined, 'label': 'Notifikasi'},
      {'icon': Icons.receipt_long_outlined, 'label': 'Riwayat Aktivitas'},
      {'icon': Icons.settings_outlined, 'label': 'Pengaturan'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 16),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              color: AppColors.primary,
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 32, color: AppColors.primary),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Budi Santoso',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'budi.santoso@email.com',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...menuItems.map(
              (item) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading:
                    Icon(item['icon'] as IconData, color: AppColors.primary),
                title: Text(
                  item['label'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textDark,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
            const Divider(height: 12, color: Colors.grey),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: const Icon(Icons.logout, color: AppColors.danger),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.danger,
                ),
              ),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}