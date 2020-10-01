//
//  CategoryCell.swift
//  cooker
//
//  Created by Irfan Shah on 18/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct CategoryCell: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill()
                .foregroundColor(.primary)
                .colorInvert()
            
            Text(self.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.primary)
            
        }
        .frame(width: 260, height: 220, alignment: .center)
        .cornerRadius(16)
        .shadow(color: .primary, radius: 3)
        .padding()
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(title: "Breakfast")
    }
}
