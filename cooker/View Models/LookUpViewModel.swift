//
//  LookUpViewModel.swift
//  cooker
//
//  Created by Irfan Shah on 18/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

class LookUpViewModel: ObservableObject {
    
    @Published public var meal: Meal?
    
    var tags: [String]? {
        let strTags = self.meal?.strTags?.split(separator: ",").map { String($0) }
        return strTags
    }
    
    var ingredients: [IngredientModel] {
        var tempIngredients: [IngredientModel] = []
        
        if let ingredient = self.meal?.strIngredient1, let quantity = self.meal?.strMeasure1 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient2, let quantity = self.meal?.strMeasure2 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient3, let quantity = self.meal?.strMeasure3 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient4, let quantity = self.meal?.strMeasure4 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient5, let quantity = self.meal?.strMeasure5 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient6, let quantity = self.meal?.strMeasure6 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient7, let quantity = self.meal?.strMeasure7 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient8, let quantity = self.meal?.strMeasure8 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient9, let quantity = self.meal?.strMeasure9 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient10, let quantity = self.meal?.strMeasure10 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient11, let quantity = self.meal?.strMeasure11 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient12, let quantity = self.meal?.strMeasure12 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient13, let quantity = self.meal?.strMeasure13 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient14, let quantity = self.meal?.strMeasure14 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient15, let quantity = self.meal?.strMeasure15 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient16, let quantity = self.meal?.strMeasure16 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient17, let quantity = self.meal?.strMeasure17 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient18, let quantity = self.meal?.strMeasure18 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient19, let quantity = self.meal?.strMeasure19 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        if let ingredient = self.meal?.strIngredient20, let quantity = self.meal?.strMeasure20 {
            if !ingredient.isEmpty {
                tempIngredients.append(IngredientModel(id: UUID(), name: ingredient, quantity: quantity))
            }
        }
        
        return tempIngredients
    }
    
    func fetch(by mealId: String) {
        
        let params = [
            "i": mealId
        ]
        
        APIService.shared.REQUEST(endpoint: .lookup, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                self.meal = response.meals[0]
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
