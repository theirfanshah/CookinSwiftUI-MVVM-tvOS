//
//  IngredientsViewModel.swift
//  cooker
//
//  Created by Irfan Shah on 23/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

class IngredientsViewModel: ObservableObject {
    
    @Published public var ingredients: [Ingredient]?
    
    func fetch() {
        
        let params = [
            "i": "list"
        ]
        
        APIService.shared.REQUEST(endpoint: .ingredients, params: params) { (result: Result<IngredientResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                
                self.ingredients = response.meals
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
