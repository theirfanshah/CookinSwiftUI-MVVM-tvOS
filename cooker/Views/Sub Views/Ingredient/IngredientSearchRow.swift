//
//  IngredientSearchRow.swift
//  cooker
//
//  Created by Irfan Shah on 23/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct IngredientSearchRow: View {
    
    var ingredients: [Ingredient]?
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Search Meal By Ingredient")
                .font(.title)
                .padding([.leading])
            List(self.ingredients!.indices, id: \.self) { index in
                NavigationLink(destination: FilteredIngredientView(ingredient: self.ingredients![index].strIngredient ?? "")) {
                    IngredientSearchCell(ingredient: self.ingredients?[index])
                }.buttonStyle(PlainButtonStyle())
            }.id(UUID())
        }
    }
}

struct IngredientSearchRow_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSearchRow()
    }
}
