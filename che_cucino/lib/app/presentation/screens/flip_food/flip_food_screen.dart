import 'package:auto_route/auto_route.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';
import 'package:che_cucino/app/presentation/widgets/suggestion_card.dart';
import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

@RoutePage()
class FlipFoodScreen extends StatelessWidget {
  const FlipFoodScreen({super.key});

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
          'FlipFood',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sostituzioni intelligenti',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ti manca un ingrediente? Trova l\'alternativa perfetta senza compromettere il sapore del tuo piatto.',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Inserisci ingrediente da sostituire',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 30),
            const Text(
              'Alternative suggerite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const SuggestionCard(
              title: 'Olio d\'Oliva',
              subtitle:
                  'Usa l\'olio d\'oliva in proporzione dell\'80% rispetto al burro (es. 80g di olio per 100g di burro). Perfetto per saltare in padella o arrostire.',
              suggestionType: 'Ottima alternativa',
              suggestionColor: Colors.green,
              suggestionIcon: Icons.check_circle,
            ),
            const SuggestionCard(
              title: 'Yogurt Greco',
              subtitle:
                  'Sostituisci in rapporto 1:1 per ridurre i grassi. Mantiene i dolci umidi e soffici, aggiungendo una leggera nota acidula.',
              suggestionType: 'Buona opzione',
              suggestionColor: Colors.orange,
              suggestionIcon: Icons.thumb_up,
            ),
            const SuggestionCard(
              title: 'Purea di Avocado',
              subtitle:
                  'Ricco di grassi sani. Ottimo per biscotti e brownies al cioccolato dove il colore verde viene mascherato.',
              suggestionType: 'Creativa',
              suggestionColor: Colors.blue,
              suggestionIcon: Icons.lightbulb,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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
          hintText: 'Es. Latte, Uova, Farina...',
          border: InputBorder.none,
        ),
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
