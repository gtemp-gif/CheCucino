import 'package:auto_route/auto_route.dart';
import 'package:che_cucino/app/presentation/widgets/fridge_item_card.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';
import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

@RoutePage()
class SmartFridgeScreen extends StatelessWidget {
  const SmartFridgeScreen({super.key});

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
          'Frigo Intelligente',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildSummary(),
            const SizedBox(height: 20),
            const FridgeItemCard(
              title: 'Latte Fresco',
              subtitle: '1 Bottiglia • Aperto ieri',
              expiry: 'Oggi',
              icon: Icons.water_drop,
              statusColor: AppColors.statusUrgent,
            ),
            const FridgeItemCard(
              title: 'Pane Integrale',
              subtitle: '½ Filone • Dispensa',
              expiry: 'Scaduto',
              icon: Icons.bakery_dining,
              statusColor: AppColors.statusUrgent,
            ),
            const FridgeItemCard(
              title: 'Uova Bio',
              subtitle: '4 Pezzi • Frigo',
              expiry: '2 Giorni',
              icon: Icons.egg,
              statusColor: AppColors.statusWarning,
            ),
            const FridgeItemCard(
              title: 'Mozzarella',
              subtitle: '2 x 125g • Frigo',
              expiry: '7 Giorni',
              icon: Icons.local_pizza,
              statusColor: AppColors.statusOk,
            ),
            const FridgeItemCard(
              title: 'Mele Golden',
              subtitle: '1.5 kg • Cesta Frutta',
              expiry: '10 Giorni',
              icon: Icons.nutrition,
              statusColor: AppColors.statusOk,
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20),
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
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: AppColors.textSecondary),
          hintText: 'Cerca nel frigo...',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSummary() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Totale articoli',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            Text(
              '24',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            _buildStatusIndicator(AppColors.statusUrgent, '3 Urgenti'),
            SizedBox(width: 16),
            _buildStatusIndicator(AppColors.statusWarning, '5 In scadenza'),
          ],
        )
      ],
    );
  }

  static Widget _buildStatusIndicator(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildFloatingActionButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.surfaceLight,
          child: const Icon(Icons.qr_code_scanner,
              color: AppColors.textSecondary),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.surfaceLight,
          child:
              const Icon(Icons.photo_camera, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
