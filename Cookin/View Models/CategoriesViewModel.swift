//
//  CategoriesViewModel.swift
//  cooker
//
//  Created by Irfan Shah on 18/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    
    @Published public var categories: [Category]?
        
    func fetch() {
        APIService.shared.REQUEST(endpoint: .category, params: nil) { (result: Result<CategoriesResponse, APIService.APIError>) in
            switch result {
            case .success(let response):
                self.categories = response.categories
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
