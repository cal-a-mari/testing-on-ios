//
//  Recipe.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import Foundation

enum Category: Int {
  case breakfast, lunch, dinner
  
  var description: String {
    switch self {
    case .breakfast:
      return "Breakfast"
    case .lunch:
      return "Lunch"
    case .dinner:
      return "Dinner"
    }
  }
}

struct Recipe: Hashable {
  let name: String
  let description: String
  let category: Category
  let ingredients: Set<String>
}
