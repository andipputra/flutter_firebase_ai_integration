import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ai_integration/data/models/recipe_model.dart';
import 'package:flutter_ai_integration/data/repositories/recipe_repository.dart';

class RecipeNotifier extends ChangeNotifier {
  final RecipeRepository recipeRepository;

  RecipeNotifier(this.recipeRepository);

  Future<RecipeModel?> getRecipe(List<String> ingredients) async {
    return await recipeRepository.getRecipeByIngredients(ingredients);
  }

  Future<RecipeModel?> getRecipeByImage(File imageFile) async {
    return await recipeRepository.getRecipeByImage(imageFile);
  }
}
