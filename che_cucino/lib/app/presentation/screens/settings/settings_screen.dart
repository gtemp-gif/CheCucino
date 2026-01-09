import 'package:auto_route/auto_route.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';
import 'package:che_cucino/app/presentation/widgets/settings_list_item.dart';
import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: NeoButton(
            onPressed: null,
            width: 40,
            height: 40,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Icon(Icons.arrow_back, color: AppColors.textMain),
          ),
        ),
        title: const Text(
          'Impostazioni',
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubscriptionCard(),
            const SizedBox(height: 30),
            _buildSectionTitle('Preferenze'),
            const SizedBox(height: 10),
            _buildPreferences(),
            const SizedBox(height: 30),
            _buildSectionTitle('Applicazione'),
            const SizedBox(height: 10),
            _buildApplicationSettings(),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'CheCucino v2.4.0',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSubscriptionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFc2c4bc),
            offset: Offset(12, 12),
            blurRadius: 24,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-12, -12),
            blurRadius: 24,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.accentTerracotta, AppColors.primary],
              ),
            ),
            child: const Icon(Icons.workspace_premium, color: Colors.white),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stato abbonamento',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'CheCucino Plus',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          NeoButton(
            onPressed: () {},
            width: 40,
            height: 40,
            borderRadius: BorderRadius.circular(12),
            child: const Icon(Icons.edit, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }

  Widget _buildPreferences() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SettingsListItem(
            title: 'Preferenze alimentari',
            icon: Icons.restaurant,
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Vegetariano',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                Icon(Icons.chevron_right, color: AppColors.textSecondary),
              ],
            ),
            onTap: () {},
          ),
          const Divider(height: 1),
          SettingsListItem(
            title: 'Visibilità calorie',
            icon: Icons.local_fire_department,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppColors.primary,
            ),
          ),
          const Divider(height: 1),
          SettingsListItem(
            title: 'Promemoria acqua',
            icon: Icons.water_drop,
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationSettings() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SettingsListItem(
            title: 'Umore e promemoria',
            icon: Icons.mood,
            trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            onTap: () {},
          ),
          const Divider(height: 1),
          SettingsListItem(
            title: 'Generali',
            icon: Icons.tune,
            trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            onTap: () {},
          ),
          const Divider(height: 1),
          SettingsListItem(
            title: 'Privacy e sicurezza',
            icon: Icons.lock,
            trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home),
          _buildNavBarItem(Icons.kitchen),
          _buildNavBarItem(Icons.favorite),
          _buildNavBarItem(Icons.settings, isSelected: true),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
        ),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}
