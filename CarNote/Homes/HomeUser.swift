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
            ShopView()  .tabItem{
                    Image(systemName: "cart")
                    Text("Shop")
                }
            CarListView().tabItem{
                Image(systemName: "car")
                Text("Car")
            }
            AddCarUIView() .tabItem{
                Image(systemName: "plus.circle.fill")
                Text("Add")
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
