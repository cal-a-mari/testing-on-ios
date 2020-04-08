//
//  ArrayExtensions.swift
//  MyRecipes
//
//  Created by Mari Batilando on 4/8/20.
//  Copyright © 2020 Mari Batilando. All rights reserved.
//

import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
