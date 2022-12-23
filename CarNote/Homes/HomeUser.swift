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
          //  ContentView()
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
            ChatUIView()  .tabItem{
                Image(systemName: "bolt.horizontal.circle.fill")
                Text("Chat")
            }
            UserProfileView()
                .tabItem{
                Image(systemName: "person")
                Text("Account")
            }
            
            
        }
    }
}
struct HomeUser_Previews: PreviewProvider {
    static var previews: some View {
        HomeUser()
    }
}
