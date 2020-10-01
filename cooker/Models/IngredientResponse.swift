//
//  IngredientResponse.swift
//  cooker
//
//  Created by Irfan Shah on 20/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

struct IngredientResponse: Codable {
    let meals: [Ingredient]
}

struct Ingredient: Codable {
    let idIngredient: String?
    let strIngredient: String?
    let strDescription: String?
    let strType: String?
}

struct IngredientModel: Identifiable {
    var id: UUID
    
    let name: String
    let quantity: String
}
