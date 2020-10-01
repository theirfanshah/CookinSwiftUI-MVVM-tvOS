//
//  RandomViewModel.swift
//  cooker
//
//  Created by Irfan Shah on 17/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

class RandomViewModel: ObservableObject {
        
    @Published public var meals: [Meal]?
    
    var tempMeals: [Meal] = []
    
    func fetch() {
        
        if self.tempMeals.count < 10 {
            APIService.shared.REQUEST(endpoint: .random, params: nil) { (result: Result<MealsResponse, APIService.APIError>) in
                switch result {
                case .success(let response):
                    if self.tempExist(meal: response.meals[0]) {
                        self.fetch()
                    } else {
                        self.tempMeals.append(response.meals[0])
                        self.fetch()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            self.meals = self.tempMeals
        }
    }
    
    private func tempExist(meal: Meal?) -> Bool {
        
        var isExists = false
        tempMeals.forEach { (tempMeal) in
            if meal?.idMeal == tempMeal.idMeal {
                isExists = true
            } else {
                isExists = false
            }
        }
        return isExists
    }
    
}
