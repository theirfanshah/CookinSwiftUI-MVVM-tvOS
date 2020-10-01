//
//  IngredientSearchCell.swift
//  cooker
//
//  Created by Irfan Shah on 23/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct IngredientSearchCell: View {
    
    var ingredient: Ingredient?
    
    var body: some View {
        ZStack {
            HStack {
                WebImage(url: APIService.shared.GETMEDIA(of: self.ingredient?.strIngredient ?? ""))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                }
                .transition(.fade(duration: 0.5))
                .cornerRadius(12)
                .animation(.spring())
                .frame(width: 400, height: 400, alignment: .center)
                
                Text(self.ingredient?.strIngredient ?? "")
                    .lineLimit(1)
                    .font(.title)
            }
            .frame(width: UIScreen.main.bounds.width - 300, height: 450)
            .background(Color.init("primaryInvert"))
            .cornerRadius(16)
            
        }
    }
}

struct IngredientSearchCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSearchCell()
    }
}
