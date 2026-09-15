import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/pet_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetCare'),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 22,
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kesehatan Pet, Prioritas Kami',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Konsultasi dokter hewan kapan saja, di mana saja.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SectionTitle(title: 'Layanan Kami'),
                SizedBox(
                  height: 108,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 6,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, i) {
                      const services = <(IconData, String, String?)>[
                        (Icons.chat_bubble_outline_rounded, 'Konsultasi', AppRoutes.consultation),
                        (Icons.local_hospital_outlined, 'Booking\nKlinik', AppRoutes.bookingKlinik),
                        (Icons.content_cut_rounded, 'Grooming', null),
                        (Icons.storefront_outlined, 'Pet Shop', AppRoutes.petShop),
                        (Icons.vaccines_outlined, 'Vaksin &\nObat', AppRoutes.healthRecord),
                      ];
                      if (i < services.length) {
                        final s = services[i];
                        return ServiceCard(
                          icon: s.$1,
                          label: s.$2,
                          onTap: s.$3 == null ? () {} : () => Navigator.pushNamed(context, s.$3!),
                        );
                      }
                      return const ServiceCard(
                        icon: Icons.emergency_outlined,
                        label: 'Emergency',
                        onTap: _noop,
                      );
                    },
                  ),
                ),
                SectionTitle(
                  title: 'Pet Saya',
                  onSeeAll: () => Navigator.pushNamed(context, AppRoutes.myPet),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: DummyData.pets.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 12),
                    itemBuilder: (context, index) => PetCard(
                      pet: DummyData.pets[index],
                      onTap: () => Navigator.pushNamed(context, AppRoutes.myPet),
                    ),
                  ),
                ),
                SectionTitle(
                  title: 'Dokter Hewan',
                  onSeeAll: () =>
                      Navigator.pushNamed(context, AppRoutes.doctorList),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: DummyData.doctors.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final doc = DummyData.doctors[index];
                      return SizedBox(
                        width: 90,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  AppColors.primary.withValues(alpha: 0.1),
                              child: const Icon(Icons.person_rounded,
                                  color: AppColors.primary, size: 32),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              doc.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textDark,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _noop() {}
