//
//  HomeView.swift
//  cooker
//
//  Created by Irfan Shah on 16/08/2020.
//  Copyright © 2020 appetizer. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var searchVM = SearchViewModel()
    @ObservedObject private var randomVM = RandomViewModel()
    @ObservedObject private var filterVM = FilterCategoryViewModel()
    @ObservedObject private var categoriesVM = CategoriesViewModel()
    
    @State var hour = 8
    
    var body: some View {
        ZStack {
            if self.searchVM.meal?.meals.count ?? 0 > 0 || self.randomVM.meals?.count ?? 0 > 0 || self.filterVM.meals?.count ?? 0 > 0 {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        if self.filterVM.meals?.count ?? 0 > 0 {
                            MealsRow(headline: hour < 10 ? "Breakfast" : hour > 10 && hour < 16 ? "Lunch" : "Dinner", meals: self.filterVM.meals, width: 500, height: 500)
                        } else {
                            Spacer()
                        }
                        
                        if self.categoriesVM.categories?.count ?? 0 > 0 {
                            CategoriesRow(categories: self.categoriesVM.categories)
                        } else {
                            Spacer()
                        }
                        
                        if self.searchVM.meal?.meals.count ?? 0 > 0 {
                            MealsRow(headline: "Just For You", meals: self.searchVM.meal?.meals, width: 400, height: 400)
                        } else {
                            Spacer()
                        }
                        
                        if self.filterVM.nextMeals?.count ?? 0 > 0 {
                            MealsRow(headline: hour < 10 ? "Lunch" : hour > 10 && hour < 16 ? "Dinner" : "Tomorrow Breakfast", meals: self.filterVM.nextMeals, width: 400, height: 400)
                        } else {
                            Spacer()
                        }
                        
                        if self.randomVM.meals?.count ?? 0 > 0 {
                            MealsRow(headline: "Random Picks", meals: self.randomVM.meals, width: 400, height: 400)
                        } else {
                            Spacer()
                        }
                        
                    }
                }
                
            } else {
                Spacer()
            }
            
        }
        .onAppear() {
            
            let date = Date()
            let calendar = Calendar.current
            self.hour = calendar.component(.hour, from: date)
            
            self.randomVM.fetch()
            self.searchVM.fetchForDay()
            self.filterVM.fetch(hour: self.hour, next: false)
            self.filterVM.fetch(hour: self.hour, next: true)
            self.categoriesVM.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
