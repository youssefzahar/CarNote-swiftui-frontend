//
//  ContentView.swift
//  carNote
//
//  Created by youssef-mariem on 12/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            ShopUIView()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Shop")
                }
            StatistiqueUIView().tabItem{
                Image(systemName: "chart.xyaxis.line")
                Text("Stat")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
