//
//  FilteredIngredientView.swift
//  cooker
//
//  Created by Irfan Shah on 23/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct FilteredIngredientView: View {
    
    @ObservedObject var filterVM = FilterCategoryViewModel()
    
    var ingredient = ""
    
    var body: some View {
        ZStack {
            if self.filterVM.meals?.count ?? 0 > 0 {
                MealsRow(headline: "\(ingredient) Recipies", meals: self.filterVM.meals, width: 500, height: 500)
            } else {
                Spacer()
            }
        }
        .onAppear() {
            self.filterVM.fetch(ingredient: self.ingredient)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct FilteredIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredIngredientView()
    }
}
