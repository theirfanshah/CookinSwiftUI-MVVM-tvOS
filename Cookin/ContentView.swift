//
//  ContentView.swift
//  cooker
//
//  Created by Irfan Shah on 16/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabbarView()
    }
}

struct TabbarView: View {
    @State var selectedTab = Tab.home
    
    enum Tab: Int {
        case home, ingredient
    }
    
    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
    
    var body: some View {
        ZStack {
            Color.init("bgColor")
                .edgesIgnoringSafeArea(.all)
            TabView(selection: self.$selectedTab) {
                NavigationView {
                    HomeView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }.tabItem {
                    self.tabbarItem(text: "Home", image: "")
                }.tag(Tab.home)
                
                NavigationView {
                    IngredientsView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                }.tabItem {
                    self.tabbarItem(text: "Ingredients", image: "")
                }.tag(Tab.ingredient)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
