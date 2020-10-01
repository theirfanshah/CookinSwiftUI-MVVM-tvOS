//
//  CategoryView.swift
//  cooker
//
//  Created by Irfan Shah on 22/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    
    @ObservedObject private var categoryVM = FilterCategoryViewModel()
    
    var category = "breakfast"
    
    var body: some View {
        ZStack {
            if self.categoryVM.meals?.count ?? 0 > 0 {
                    MealsRow(headline: self.category, meals: self.categoryVM.meals, width: 500, height: 500)
//                    CategoryGridView(categories: self.categoryVM.meals)
            } else {
                Spacer()
            }
        }
    .navigationBarTitle("")
    .navigationBarHidden(true)
        .onAppear() {
            self.categoryVM.fetch(category: self.category)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
