//
//  IngredientsRow.swift
//  cooker
//
//  Created by Irfan Shah on 20/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct IngredientsRow: View {
    
    var ingredients: [IngredientModel]?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                Text("Ingredients")
                .font(.title)
                .padding([.leading])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 25) {
                    ForEach(self.ingredients!.indices) { index in
                        Button(action: {}) {
                            IngredientCell(item: self.ingredients?[index])
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
}

struct IngredientsRow_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsRow()
    }
}
