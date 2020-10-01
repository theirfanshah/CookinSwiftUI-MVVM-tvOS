//
//  TagsCell.swift
//  cooker
//
//  Created by Irfan Shah on 19/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct TagCell: View {
    
    var title: String
    
    var body: some View {
        Group{
            Text(self.title)
                .font(.headline)
                .padding()
                .lineLimit(1)
        }
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 8)
        .padding()
    }
}

struct TagCell_Previews: PreviewProvider {
    static var previews: some View {
        TagCell(title: "Brunch")
    }
}
