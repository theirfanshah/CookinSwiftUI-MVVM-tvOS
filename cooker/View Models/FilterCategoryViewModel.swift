//
//  FilterCategoryViewModel.swift
//  cooker
//
//  Created by Irfan Shah on 17/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

class FilterCategoryViewModel: ObservableObject {
    
    @Published public var meals: [Meal]?
    @Published public var nextMeals: [Meal]?
    
    func fetch(hour: Int, next: Bool) {
        
        var params: [String: String] = [:]
        
        let categories = ["Goat", "Vegeterian", "Seafood", "Lamb", "Chicken", "Beef"]
        
        if hour < 10 {
            if !next {
                params = [
                    "c": "Breakfast"
                ]
            } else {
                params = [
                    "c": categories.randomElement()!
                ]
            }
        } else if hour > 10 && hour < 16 {
            params = [
                "c": categories.randomElement()!
            ]
        } else if hour > 16 {
            if !next {
                params = [
                    "c": categories.randomElement()!
                ]
            } else {
                params = [
                    "c": "Breakfast"
                ]
            }
        }
        
        APIService.shared.REQUEST(endpoint: .filter, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                if !next {
                    self.meals = response.meals
                } else {
                    self.nextMeals = response.meals
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetch(category: String) {
        
        let params = [
            "c": category
        ]
        
        APIService.shared.REQUEST(endpoint: .filter, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                
                self.meals = response.meals
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetch(ingredient: String) {
        
        let params = [
            "i": ingredient
        ]
        
        APIService.shared.REQUEST(endpoint: .filter, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                
                self.meals = response.meals
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
