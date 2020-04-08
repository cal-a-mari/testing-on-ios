//
//  SceneDelegate.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let _ = (scene as? UIWindowScene), let winScene = (scene as? UIWindowScene) else { return }
    
    RecipeDataStore.shared.addRecipe(
      Recipe(name: "Roast Chicken",
             description: "Cozy up to the perfect family dinner with Ina's easy roast chicken. She uses simple ingredients to create tons of flavor.",
             category: .breakfast,
             ingredients: ["1 (5 to 6 pound) roasting chicken",
                           "Freshly ground black pepper",
                           "1 large bunch fresh thyme, plus 20 sprigs"]),
      withKey: "1")
    
    RecipeDataStore.shared.addRecipe(
      Recipe(name: "Peanut Butter-Chocolate No-Bake Cookies",
             description: "No oven needed for these chocolatey delights! Just mix a few pantry ingredients together and wait — and you'll have cookies in no time!",
             category: .lunch,
             ingredients: ["2 cups sugar",
                           "1/2 cup milk",
                           "1 stick (8 tablespoons) unsalted butter"]),
      withKey: "2")
    
    RecipeDataStore.shared.addRecipe(
      Recipe(name: "Shepherd's Pie",
             description: "Warm up to this hearty classic that’s packed with savory meat, veggies and irresistible flavor",
             category: .dinner,
             ingredients: ["1 1/2 pounds russet potatoes",
                           "1/4 cup half-and-half",
                           "2 ounces unsalted butter"]),
      withKey: "3")
    
    
    let rootViewController = RecipeListTableViewController(recipeList: RecipeList(recipes: RecipeDataStore.shared.getAllRecipes()))
    window = UIWindow(windowScene: winScene)
    window!.rootViewController = UINavigationController(rootViewController: rootViewController)
    window!.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

