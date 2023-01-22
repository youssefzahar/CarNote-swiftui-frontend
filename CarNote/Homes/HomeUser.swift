//
//  HomeUser.swift
//  carNote
//
//  Created by youssef-mariem on 13/12/2022.
//

import SwiftUI

struct HomeUser: View {
    var body: some View {
        TabView {
            
            ProductListUIView()  .tabItem{
                    Image(systemName: "cart")
                    Text("Shop")
                }
            CarListView().tabItem{
                Image(systemName: "car")
                Text("My Cars")
            }
            AddCarUIView() .tabItem{
                Image(systemName: "plus.circle.fill")
                Text("Add")
            }
            
            CarShopListView().tabItem{
                Image(systemName: "car.side.fill")
                Text("Car Shop")
            }      
            
            EntretienView()
                .tabItem{
                Image(systemName: "calendar")
                Text("Entretien")
            }
            
            
        }
    }
}

struct HomeUser_Previews: PreviewProvider {
    static var previews: some View {
        HomeUser()
    }
}
