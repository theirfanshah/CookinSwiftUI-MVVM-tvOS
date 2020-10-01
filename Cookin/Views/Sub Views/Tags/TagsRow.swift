//
//  TagsRow.swift
//  cooker
//
//  Created by Irfan Shah on 19/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct TagsRow: View {
    
    var tags: [String]?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 0) {
                if self.tags != nil {
                    ForEach(self.tags!.indices) { index in
                        NavigationLink (destination: FilteredTagsView(tag: self.tags?[index] ?? "")) {
                            TagCell(title: self.tags?[index] ?? "")
                        }.buttonStyle(PlainButtonStyle())
                    }
                } else {
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct TagsRow_Previews: PreviewProvider {
    static var previews: some View {
        TagsRow()
    }
}
