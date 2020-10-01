//
//  FilteredTagsView.swift
//  cooker
//
//  Created by Irfan Shah on 23/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct FilteredTagsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var searchVM = SearchViewModel()
    
    var tag = ""
    
    var body: some View {
        ZStack {
            if self.searchVM.meal?.meals.count ?? 0 > 0 {
                MealsRow(headline: tag, meals: self.searchVM.meal?.meals, width: 500, height: 500)
            } else {
                VStack {
                    HStack {
                        Button (action: { self.presentationMode.wrappedValue.dismiss() }) {
                            Text("Back")
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .onAppear() {
            self.searchVM.fetchByName(name: self.tag)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct FilteredTagsView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredTagsView()
    }
}
