//
//  RecipeDetailViewController.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailViewController: UIViewController {
  private let recipe: Recipe
  
  init(recipe: Recipe) {
    self.recipe = recipe
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = recipe.name
    buildSubviews()
  }
  
  private func buildSubviews() {
    let nameLabel = createLabel(withText: recipe.name,
                                accessibilityLabel: "name-label")
    let descriptionLabel = createLabel(withText: recipe.description,
                                       accessibilityLabel: "description-label")
    let ingredientsLabel = createLabel(withText: recipe.ingredients.joined(separator: ","),
                                       accessibilityLabel: "ingredients-label")
    let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                   descriptionLabel,
                                                   ingredientsLabel])
    stackView.frame = CGRect(x: 0.0,
                             y: 0.0,
                             width: view.bounds.size.width,
                             height: view.bounds.size.height * 0.75)
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    view.addSubview(stackView)
  }
  
  private func createLabel(withText text: String, accessibilityLabel: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = .black
    label.numberOfLines = 0
    label.accessibilityLabel = accessibilityLabel
    return label
  }
}
