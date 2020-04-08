//
//  RecipeDataStore.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import Foundation

class RecipeDataStore {
  private var recipesMapping = [String: Recipe]()
  var count: Int {
    return recipesMapping.count
  }
  static var shared: RecipeDataStore = {
    return RecipeDataStore();
  }()
  
  func addRecipe(_ recipe: Recipe, withKey key: String) {
    recipesMapping[key] = recipe
  }
  
  func getRecipe(with key: String) -> Recipe? {
    return recipesMapping[key]
  }
  
  func getAllRecipes() -> Set<Recipe> {
    return Set(recipesMapping.values)
  }
  
  func deleteRecipe(with key: String) {
    recipesMapping.removeValue(forKey: key)
  }
}
