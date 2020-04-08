//
//  ViewController.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import UIKit

class RecipeListTableViewController: UITableViewController {
  
  private let recipeList: RecipeList
  private static let cellIdentifier = "RecipeCell"
  
  init(recipeList: RecipeList) {
    self.recipeList = recipeList
    super.init(style: .grouped)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "Recipes"
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: RecipeListTableViewController.cellIdentifier)
  }
  
  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
    return recipeList.numberOfRows(in: section)
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return recipeList.titleForHeader(in: section)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return recipeList.numberOfSections
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeListTableViewController.cellIdentifier),
      let recipe = recipeList.recipe(for: indexPath) else {
      return UITableViewCell()
    }
    
    cell.textLabel?.text = recipe.name
    cell.textLabel?.textColor = .black
    cell.backgroundColor = .white
    cell.accessibilityLabel = String("row-\(indexPath.row)")
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let recipe = recipeList.recipe(for: indexPath) else { return }
    navigationController?.pushViewController(RecipeDetailViewController(recipe: recipe),
                                             animated: true)
  }
}

