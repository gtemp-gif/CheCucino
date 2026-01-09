import 'package:auto_route/auto_route.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';
import 'package:che_cucino/app/presentation/widgets/shopping_list_item.dart';
import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

@RoutePage()
class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

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
            child: Icon(Icons.menu, color: AppColors.textMain),
          ),
        ),
        title: const Text(
          'Lista Spesa',
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: NeoButton(
              onPressed: null,
              width: 40,
              height: 40,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Icon(Icons.person, color: AppColors.textMain),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 30),
          _buildCategory(
            title: 'Verdura e Frutta',
            icon: Icons.eco,
            itemCount: 3,
            items: [
              const ShoppingListItem(
                title: 'Pomodori Ramati',
                isMissing: true,
              ),
              const ShoppingListItem(
                title: 'Zucchine',
                subtitle: '~ 500g',
              ),
              const ShoppingListItem(
                title: 'Basilico Fresco',
                isChecked: true,
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildCategory(
            title: 'Latticini e Uova',
            icon: Icons.egg,
            itemCount: 2,
            items: [
              const ShoppingListItem(
                title: 'Mozzarella',
                isMissing: true,
              ),
              const ShoppingListItem(
                title: 'Parmigiano Reggiano',
                isChecked: true,
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildCategory(
            title: 'Dispensa',
            icon: Icons.kitchen,
            itemCount: 2,
            items: [
              const ShoppingListItem(
                title: 'Pasta di Semola',
                subtitle: 'Spaghetti n.5',
              ),
              const ShoppingListItem(
                title: 'Olio EVO',
                isChecked: true,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFc2c4bc),
            offset: Offset(8, 8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          NeoButton(
            onPressed: () {},
            width: 40,
            height: 40,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Aggiungi ingrediente...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const Icon(Icons.mic, color: AppColors.textSecondary),
        ],
      ),
    );
  }

  Widget _buildCategory({
    required String title,
    required IconData icon,
    required int itemCount,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.accentTerracotta),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Text(
                '$itemCount items',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...items,
      ],
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
          _buildNavBarItem(Icons.kitchen, isSelected: true),
          _buildNavBarItem(Icons.favorite),
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
