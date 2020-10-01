//
//  CategoriesResponse.swift
//  cooker
//
//  Created by Irfan Shah on 18/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable {
    var categories: [Category]
}

struct Category: Codable {
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}
