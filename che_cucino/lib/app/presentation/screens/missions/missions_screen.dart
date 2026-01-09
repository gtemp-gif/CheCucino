import 'package:auto_route/auto_route.dart';
import 'package:che_cucino/app/presentation/widgets/mission_card.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';
import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

@RoutePage()
class MissionsScreen extends StatelessWidget {
  const MissionsScreen({super.key});

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
        title: const Column(
          children: [
            Text(
              'Missioni',
              style: TextStyle(
                color: AppColors.textMain,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Premium',
              style: TextStyle(
                color: AppColors.accentTerracotta,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: NeoButton(
              onPressed: null,
              width: 40,
              height: 40,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Icon(Icons.workspace_premium,
                  color: AppColors.accentTerracotta),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Obiettivi Sostenibili',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Seleziona le tue missioni settimanali per ridurre gli sprechi e migliorare le tue abitudini in cucina.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'In Corso',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const MissionCard(
              title: 'Settimana Veg',
              description: 'Sostituisci la carne con legumi in 3 cene.',
              progress: '2 / 3 pasti',
              progressValue: 2 / 3,
              icon: Icons.eco,
              iconColor: Colors.green,
            ),
            const SizedBox(height: 30),
            const Text(
              'Nuove Missioni',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const MissionCard(
              title: 'Salva il Pane',
              description:
                  'Utilizza il pane raffermo in 2 ricette creative questa settimana.',
              icon: Icons.bakery_dining,
              iconColor: Colors.brown,
            ),
            const SizedBox(height: 20),
            const MissionCard(
              title: 'Frigo Vuoto',
              description:
                  'Cucina un pasto usando solo ingredienti in scadenza a breve.',
              icon: Icons.kitchen,
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            const MissionCard(
              title: 'Pianificatore Pro',
              description: 'Organizza i pasti per tutta la settimana in anticipo.',
              icon: Icons.calendar_month,
              iconColor: Colors.purple,
              isLocked: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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
          _buildNavBarItem(Icons.favorite, isSelected: true),
          _buildNavBarItem(Icons.settings),
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
