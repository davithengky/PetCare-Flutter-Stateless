import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../models/pet_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konsultasi Dokter')),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              children: [
                const Text(
                  'Pilih hewan yang ingin dikonsultasikan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                ...DummyData.pets.map((Pet pet) => Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        leading: const CircleAvatar(
                          radius: 26,
                          backgroundColor: AppColors.secondary,
                          child: Icon(Icons.pets, color: Colors.white, size: 24),
                        ),
                        title: Text(
                          pet.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        subtitle: Text(
                          '${pet.species} • ${pet.breed}',
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textGrey),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.doctorList),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}