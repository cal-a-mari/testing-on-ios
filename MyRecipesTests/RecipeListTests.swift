//
//  RecipeListTests.swift
//  MyRecipesTests
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import XCTest

class RecipeListTests: XCTestCase {
  
  private let roastChickenKey = "1"
  private let cookiesKey = "2"
  private let shepherdsPieKey = "3"
  
  private let roastChicken = Recipe(name: "Roast Chicken",
                                    description: "Really good chicken",
                                    category: .breakfast,
                                    ingredients: ["Chicken"])
  private let cookies =  Recipe(name: "Peanut Butter-Chocolate No-Bake Cookies",
                                description: "Cookies!",
                                category: .lunch,
                                ingredients: ["sugar"])
  private let shepherdsPie = Recipe(name: "Shepherd's Pie",
                                    description: "Pie!",
                                    category: .dinner,
                                    ingredients: ["potatoes"])
  
  private var store: RecipeDataStore!
  private var recipeList: RecipeList!
  
  override func setUp() {
    store = RecipeDataStore()
    store.addRecipe(roastChicken, withKey: roastChickenKey)
    store.addRecipe(cookies, withKey: cookiesKey)
    store.addRecipe(shepherdsPie, withKey: shepherdsPieKey)
    
    recipeList = RecipeList(recipes: store.getAllRecipes())
  }
  
  override func tearDown() {
    store = nil
  }
  
  func testRecipeListNumberOfSections() {
    XCTAssert(recipeList.numberOfSections == 3)
  }
  
  func testRecipeListGetRecipeForIndexPath() {
    XCTAssertNotNil(recipeList.recipe(for: IndexPath(row: 0, section: 0)))
    XCTAssertNil(recipeList.recipe(for: IndexPath(row: 1, section: 0)))
  }
  
  func testRecipeListNumberOfRowsInSection() {
    XCTAssert(recipeList.numberOfRows(in: 0) == 1)
    XCTAssert(recipeList.numberOfRows(in: 1) == 1)
    XCTAssert(recipeList.numberOfRows(in: 2) == 1)
    XCTAssert(recipeList.numberOfRows(in: 3) == 0)
  }
  
  func testRecipeListTitleForHeaderInSection() {
    XCTAssert(recipeList.titleForHeader(in: 0) == Category.breakfast.description)
    XCTAssert(recipeList.titleForHeader(in: 1) == Category.lunch.description)
    XCTAssert(recipeList.titleForHeader(in: 2) == Category.dinner.description)
    XCTAssertNil(recipeList.titleForHeader(in: 3))
  }
}
