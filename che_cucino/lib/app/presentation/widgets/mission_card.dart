import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';

class MissionCard extends StatelessWidget {
  final String title;
  final String description;
  final String? progress;
  final double? progressValue;
  final bool isLocked;
  final IconData icon;
  final Color iconColor;

  const MissionCard({
    super.key,
    required this.title,
    required this.description,
    this.progress,
    this.progressValue,
    this.isLocked = false,
    required this.icon,
    this.iconColor = AppColors.textMain,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          offset: const Offset(-4, -4),
                          blurRadius: 8,
                          spreadRadius: -4,
                        ),
                      ],
                    ),
                    child: Icon(icon, color: iconColor),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (progress != null && progressValue != null) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Progresso',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      progress!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progressValue!,
                  backgroundColor: AppColors.backgroundLight,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ],
              if (!isLocked)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: NeoButton(
                    onPressed: () {},
                    width: 100,
                    height: 40,
                    borderRadius: BorderRadius.circular(20),
                    child: const Center(
                      child: Text(
                        'Aggiungi',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (isLocked)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      color: AppColors.textSecondary,
                      size: 40,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sblocca altre 10 missioni',
                      style: TextStyle(
                        color: AppColors.textMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
