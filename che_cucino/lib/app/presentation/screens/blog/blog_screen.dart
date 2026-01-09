import 'package:auto_route/auto_route.dart';
import 'package:che_cucino/app/presentation/widgets/blog_post_card.dart';
import 'package:che_cucino/app/presentation/widgets/neo_button.dart';
import 'package:flutter/material.dart';
import 'package:che_cucino/core/theme/colors.dart';

@RoutePage()
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

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
          'CheCucino',
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
              'News & Blog',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Scopri consigli, trucchi e novità culinarie.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),
            _buildCategoryChips(),
            const SizedBox(height: 30),
            const Text(
              'In evidenza',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const BlogPostCard(
              title: '5 Metodi creativi per ridurre gli sprechi alimentari',
              category: 'Sostenibilità',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAH4PXBU7JgKQ7jI3LZlgFo4S5P1G1lILHSgVbfd-osJkE_IBmR5z0PKo1sqRLEN16gUpl8ZL1beyBTNqBvzv8yiShHOGlQbrWwY7t6gjOndd44lEHf-AhuC4TCig6wUq75IonXpCcuMUviPT_BrgYL7cMJJ4FuuQoP2Dj__TkN8_7sJila2NgEn4Y3v8LNJB-e24hPFJxdhmZjWPg_NlgzU8GJmQd10VolAEZaYb6VutPfagIujUxtdRv0aC5o3G7YZLOqceAvug',
              readTime: '5 min lettura',
              date: '12 Maggio',
              isFeatured: true,
            ),
            const SizedBox(height: 30),
            const Text(
              'Più recenti',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const BlogPostCard(
              title: 'Superfood di Primavera',
              category: 'Benessere',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDpK_6kgz4f2TTexx-qLFDEMJjAAMimROENwTWsAHYo1GKKI2wPhNwXT1eLSMhFOYsFjwXdS3Mhhh2BRCLg4Mp6nIe7pSgfq34742gKieP7VqGOxk2WHCqga29OnJYWz0nb9vWkT_jwR_2RSFVfsRbEzqOftHHYBjMpv4RptEBTZIkXVzkq5ErYwBwvgUhfcWqrjbQUAy6rh-MdfJzvnNH2_wBUIkHh0m1fWM8MYOA1ERhMcduav-o1KPEMWjynue15ow1Mi0vdHQ',
              readTime: '3 min',
              date: '',
            ),
            const BlogPostCard(
              title: 'Comfort Food sano?',
              category: 'Lifestyle',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCq9RdalSc8IZ2j4QfVeDKlhBlLXaqqXLceaRiFYkEdZQvYlL_d5Qr5bc_dMOdzFBbMylUnjXYt4jfP0Atr4aYQnsx3At8BpEF-_vlLeIQy5p6YyA1y3eR2CXenmMXPCzFSLuVM4NCKtvEUIwjX7hoaXCqyzt47JyUnXi6yo1XpAL1nA_QfZVbMJ5bXWKfeJC3M7ck5GF1X5_WmsCfggatSgtjP42BNEIqTCkCWVsMmEZH4Dtu112yp25F-tYn9glpU60jff5pgzA',
              readTime: '4 min',
              date: '',
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryChip('Tutte', isSelected: true),
          _buildCategoryChip('Sostenibilità'),
          _buildCategoryChip('Consigli'),
          _buildCategoryChip('Stagionalità'),
          _buildCategoryChip('Lifestyle'),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {},
        backgroundColor: AppColors.surfaceLight,
        selectedColor: AppColors.primary.withOpacity(0.2),
        labelStyle: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
          _buildNavBarItem(Icons.kitchen),
          _buildNavBarItem(Icons.article, isSelected: true),
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
