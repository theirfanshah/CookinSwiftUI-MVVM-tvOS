//
//  MealCell.swift
//  cooker
//
//  Created by Irfan Shah on 16/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealCell: View {
    
    @State private var focused: Bool = false
    @State private var value = ""
    
    @State var meal: Meal?
    
    var width: CGFloat = 400
    var height: CGFloat = 350
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: "\(meal?.strMealThumb ?? "")"))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
            }
            .transition(.fade(duration: 0.5))
            .cornerRadius(12)
            .animation(.spring())
            .frame(width: self.width, height: self.height, alignment: .center)
            .overlay(
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(Color.black.opacity(0.75))
                        .frame(height: height / 2.7)
                    
                    Text(self.meal?.strMeal ?? "")
                        .lineLimit(2)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .colorInvert()
                        .padding()
                }
                , alignment: .bottom
            )
            
            
            //            if focused {
            //            MarqueeText(text: self.value)
            //                .frame(width: 350, height: 50)
            //                .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            
            //            }
            
        }
        .focusable(true, onFocusChange:{ (changed) in
            self.focused = changed
            self.value = self.meal?.strMeal ?? ""
        })
    }
}

struct MealCell_Previews: PreviewProvider {
    static var previews: some View {
        MealCell()
    }
}
