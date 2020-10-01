//
//  SearchViewModel.swift
//  cooker
//
//  Created by Irfan Shah on 16/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published public var meal: MealsResponse?
    
    func fetchForDay() {
        let alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        
        let date = Date()
        let calanderDate = Calendar.current.dateComponents([.day, .year, .month], from: date)
        
        if calanderDate.day != UserDefaults.standard.get(.savedDate) {
            UserDefaults.standard.set(.searchStringForDay, to: alphabets.randomElement() ?? "")
            UserDefaults.standard.set(.savedDate, to: calanderDate.day ?? 0)
        }
        
        let params = [
            "s": String(UserDefaults.standard.get(.searchStringForDay) ?? "")//alphabets.randomElement() ?? ""
        ]
        
        APIService.shared.REQUEST(endpoint: .search, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                if response.meals.count < 6 {
                    self.fetchForDay()
                } else {
                    DispatchQueue.main.async {
                        self.meal = response
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func fetchByName(name: String) {
        let params = [
            "s": name
        ]
        APIService.shared.REQUEST(endpoint: .search, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.meal = response
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func fetchByFirstLetter(letter: String) {
        let params = [
            "f": letter
        ]
        APIService.shared.REQUEST(endpoint: .search, params: params) { (result: Result<MealsResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.meal = response
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
