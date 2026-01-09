import 'package:che_cucino/data/models/recipe_model.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
