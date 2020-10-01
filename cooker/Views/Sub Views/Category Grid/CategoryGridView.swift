//
//  CategoryGridView.swift
//  cooker
//
//  Created by Irfan Shah on 22/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct CategoryGridView: View {
    
    var categories: [Meal]?
    
    var body: some View {
        VStack {
            ForEach(0..<categories!.count/3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        NavigationLink (destination: Text("Row : \(row) :: Column : \(column)")) {
                            MealCell(meal: self.categories![(row*2) + column], width: 400, height: 400)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
    }
}
