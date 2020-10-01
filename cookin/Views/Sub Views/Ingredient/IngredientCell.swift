//
//  IngredientCell.swift
//  cooker
//
//  Created by Irfan Shah on 20/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct IngredientCell: View {
    
    var item: IngredientModel?
    
    var body: some View {
        ZStack {
            VStack {
                WebImage(url: APIService.shared.GETMEDIA(of: item?.name ?? ""))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                }
                .transition(.fade(duration: 0.5))
                .cornerRadius(12)
                .animation(.spring())
                .frame(width: 300, height: 300, alignment: .center)
                
                Text(item?.name ?? "")
                    .lineLimit(1)
                    .font(.headline)
                
                Text(item?.quantity ?? "")
                    .lineLimit(1)
                    .font(.subheadline)
            }
        }
    }
}

struct IngredientCell_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCell()
    }
}
