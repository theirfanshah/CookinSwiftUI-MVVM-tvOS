//
//  MealDetailView.swift
//  cooker
//
//  Created by Irfan Shah on 18/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealDetailView: View {
    
    @ObservedObject private var lookupVM = LookUpViewModel()
    var idMeal: String?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .leading) {
                HStack {
                    Button(action: {}) {
                        WebImage(url: URL(string: self.lookupVM.meal?.strMealThumb ?? ""))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                        }
                        .transition(.fade(duration: 0.5))
                        .cornerRadius(12)
                        .animation(.spring())
                        .frame(width: 500, height: 500, alignment: .center)
                        .shadow(radius: 8)
                        .padding(.leading)
                    }.buttonStyle(PlainButtonStyle())
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text (self.lookupVM.meal?.strMeal ?? "")
                            .font(.title)
                        Divider()
                        Text("Category: \(self.lookupVM.meal?.strCategory ?? "")")
                            .font(.title)
                            .fontWeight(.thin)
                        Text("Type: \(self.lookupVM.meal?.strArea ?? "")")
                            .font(.title)
                            .fontWeight(.thin)
                        
                        if (self.lookupVM.meal != nil) {
                            TagsRow(tags: self.lookupVM.tags)
                        }
                        
                    }
                }
                VStack {
                    
                    if self.lookupVM.meal != nil {
                        IngredientsRow(ingredients: self.lookupVM.ingredients)
                    } else {
                        Spacer()
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Instructions")
                        .font(.title)
                        .padding(.leading)
                    
                    NavigationLink(destination: MealInstructionsView(instructions: self.lookupVM.meal?.strInstructions ?? "")) {
                        Text(self.lookupVM.meal?.strInstructions ?? "")
                            .lineLimit(4)
                            .frame(width: UIScreen.main.bounds.width - 200)
                            .padding()
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }
        }
        .onAppear() {
            self.lookupVM.fetch(by: self.idMeal ?? "")
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView()
    }
}
