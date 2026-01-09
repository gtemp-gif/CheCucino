import 'package:che_cucino/data/models/recipe_model.dart';

abstract class RecipeDataSource {
  Future<List<Recipe>> getRecipes();
}

class RecipeLocalDataSource implements RecipeDataSource {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Recipe(
        title: 'Spaghetti al Pomodoro Fresco',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAH4PXBU7JgKQ7jI3LZlgFo4S5P1G1lILHSgVbfd-osJkE_IBmR5z0PKo1sqRLEN16gUpl8ZL1beyBTNqBvzv8yiShHOGlQbrWwY7t6gjOndd44lEHf-AhuC4TCig6wUq75IonXpCcuMUviPT_BrgYL7cMJJ4FuuQoP2Dj__TkN8_7sJila2NgEn4Y3v8LNJB-e24hPFJxdhmZjWPg_NlgzU8GJmQd10VolAEZaYb6VutPfagIujUxtdRv0aC5o3G7YZLOqceAvug',
        time: '15 min',
        calories: '450 kcal',
        category: 'Veloce',
      ),
      Recipe(
        title: 'Insalata di Quinoa e Avocado',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDpK_6kgz4f2TTexx-qLFDEMJjAAMimROENwTWsAHYo1GKKI2wPhNwXT1eLSMhFOYsFjwXdS3Mhhh2BRCLg4Mp6nIe7pSgfq34742gKieP7VqGOxk2WHCqga29OnJYWz0nb9vWkT_jwR_2RSFVfsRbEzqOftHHYBjMpv4RptEBTZIkXVzkq5ErYwBwvgUhfcWqrjbQUAy6rh-MdfJzvnNH2_wBUIkHh0m1fWM8MYOA1ERhMcduav-o1KPEMWjynue15ow1Mi0vdHQ',
        time: '20 min',
        calories: '320 kcal',
        category: 'Healthy',
      ),
    ];
  }
}
