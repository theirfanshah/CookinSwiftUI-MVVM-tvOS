//
//  MealsRow.swift
//  cooker
//
//  Created by Irfan Shah on 17/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct MealsRow: View {
    
    var headline: String?
    var meals: [Meal]?
    var width: CGFloat = 400
    var height: CGFloat = 350
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if (headline != nil) {
                Text(headline ?? "")
                .font(.title)
                .padding([.leading])
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 25) {
                    ForEach(self.meals!.indices, id: \.self) { index in
                        NavigationLink(destination: MealDetailView(idMeal: self.meals?[index].idMeal ?? "")) {
                            MealCell(meal: self.meals?[index], width: self.width, height: self.height)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
}

struct MealsRow_Previews: PreviewProvider {
    static var previews: some View {
        MealsRow(headline: "")
    }
}
