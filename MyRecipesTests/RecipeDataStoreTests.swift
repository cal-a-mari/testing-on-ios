//
//  RecipeDataStoreTests.swift
//  MyRecipesTests
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import XCTest

class RecipeDataStoreTests: XCTestCase {
  
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
  
  override func setUp() {
    store = RecipeDataStore()
  }
  
  override func tearDown() {
    store = nil
  }
  
  func testAddRecipe() {
    store.addRecipe(roastChicken, withKey: roastChickenKey)
    XCTAssert(store.count == 1)
  }
  
  func testAddAndGetRecipe() {
    store.addRecipe(roastChicken, withKey: roastChickenKey)
    XCTAssert(store.count == 1)
    let recipe = store.getRecipe(with: roastChickenKey)
    XCTAssert(recipe?.name == "Roast Chicken")
    XCTAssert(recipe?.description == "Really good chicken")
    XCTAssert(recipe?.ingredients == ["Chicken"])
  }
  
  func testAddAndGetAllRecipes() {
    store.addRecipe(roastChicken, withKey: roastChickenKey)
    store.addRecipe(cookies, withKey: cookiesKey)
    store.addRecipe(shepherdsPie, withKey: shepherdsPieKey)
    XCTAssert(store.getAllRecipes().count == 3)
  }
  
  func testAddAndDeleteRecipe() {
    store.addRecipe(roastChicken, withKey: roastChickenKey)
    XCTAssert(store.count == 1)
    store.deleteRecipe(with: roastChickenKey)
    XCTAssert(store.count == 0)
    XCTAssertNil(store.getRecipe(with: roastChickenKey))
  }
  
//  func testPerformanceExample() {
//    // This is an example of a performance test case.
//    self.measure {
//      // Put the code you want to measure the time of here.
//    }
//  }
  
}
