import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

class ShoppingListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isMissing;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  const ShoppingListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.isMissing = false,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isChecked ? AppColors.surfaceLight.withOpacity(0.5) : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isChecked
            ? [
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
              ]
            : [
                const BoxShadow(
                  color: Color(0xFFc2c4bc),
                  offset: Offset(12, 12),
                  blurRadius: 24,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-12, -12),
                  blurRadius: 24,
                ),
              ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isChecked
                        ? AppColors.textSecondary
                        : AppColors.textMain,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                if (isMissing) ...[
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Icon(
                        Icons.error,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Manca per le ricette di oggi',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
