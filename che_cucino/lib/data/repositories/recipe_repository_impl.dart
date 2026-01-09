import 'package:che_cucino/data/datasources/recipe_datasource.dart';
import 'package:che_cucino/data/models/recipe_model.dart';
import 'package:che_cucino/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource dataSource;

  RecipeRepositoryImpl({required this.dataSource});

  @override
  Future<List<Recipe>> getRecipes() {
    return dataSource.getRecipes();
  }
}
