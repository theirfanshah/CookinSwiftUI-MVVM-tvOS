//
//  MealInstructionsView.swift
//  cooker
//
//  Created by Irfan Shah on 22/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct MealInstructionsView: View {
    
    var instructions = ""
    
    var body: some View {
        VStack {
            TextView(text: instructions)
                .padding()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct MealInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        MealInstructionsView(instructions: "")
    }
}
