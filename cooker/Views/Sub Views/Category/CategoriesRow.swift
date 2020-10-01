//
//  CategoriesRow.swift
//  cooker
//
//  Created by Irfan Shah on 18/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct CategoriesRow: View {
    
    var categories: [Category]?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Categories")
                .font(.title)
                .padding([.leading])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 0) {
                    ForEach(self.categories!.indices) { index in
                        NavigationLink (destination: CategoryView(category: self.categories?[index].strCategory ?? "")) {
                            CategoryCell(title: self.categories?[index].strCategory ?? "")
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
}

struct CategoriesRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesRow()
    }
}
