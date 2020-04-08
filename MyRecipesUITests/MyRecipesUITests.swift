//
//  MyRecipesUITests.swift
//  MyRecipesUITests
//
//  Created by Mari Batilando on 4/7/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import XCTest

class MyRecipesUITests: XCTestCase {
  
  func testListViewToDetailView() {
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()
    app.tables/*@START_MENU_TOKEN@*/.staticTexts["Peanut Butter-Chocolate No-Bake Cookies"]/*[[".cells[\"row-0\"].staticTexts[\"Peanut Butter-Chocolate No-Bake Cookies\"]",".staticTexts[\"Peanut Butter-Chocolate No-Bake Cookies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    XCTAssert(app.staticTexts["name-label"].exists)
    XCTAssert(app.staticTexts["description-label"].exists)
    XCTAssert(app.staticTexts["ingredients-label"].exists)
  }

}
