//
//  RecipeList.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import Foundation

struct RecipeList {
  private let orderedRecipes: [[Recipe]]
  
  var numberOfSections: Int {
    return orderedRecipes.count
  }
  
  init(recipes: Set<Recipe>) {
    let recipeGrouping = Dictionary(grouping: recipes, by: { $0.category })
    orderedRecipes = recipeGrouping.values.sorted(by: { $0.first!.category.rawValue < $1.first!.category.rawValue })
  }
  
  func numberOfRows(in section: Int) -> Int {
    return orderedRecipes[safe: section]?.count ?? 0
  }
  
  func titleForHeader(in section: Int) -> String? {
    return orderedRecipes[safe: section]?.first?.category.description
  }
  
  func recipe(for indexPath: IndexPath) -> Recipe? {
    return orderedRecipes[safe: indexPath.section]?[safe:indexPath.row]
  }
}
