//
//  IngredientsView.swift
//  cooker
//
//  Created by Irfan Shah on 23/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct IngredientsView: View {
    
    @ObservedObject var ingredientVM = IngredientsViewModel()
    
    var body: some View {
        ZStack {
            
            if self.ingredientVM.ingredients?.count ?? 0 > 0 {
                IngredientSearchRow(ingredients: self.ingredientVM.ingredients)
            } else {
                Spacer()
            }
            
        }
        .onAppear() {
            self.ingredientVM.fetch()
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
