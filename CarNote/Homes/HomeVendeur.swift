//
//  HomeVendeur.swift
//  carNote
//
//  Created by youssef-mariem on 12/12/2022.
//

import SwiftUI

struct HomeVendeur: View {
    var body: some View {
        TabView {
          //  ContentView()
         ProductListUIView()  .tabItem{
                    Image(systemName: "cart")
                    Text("Shop")
                }
            MyproductView().tabItem{
                Image(systemName: "gearshape")
                Text("Gestion")
            }
            AddProductUIView() .tabItem{
                Image(systemName: "plus.circle.fill")
                Text("Add")
            }
            
            UserProfileView()
                .tabItem{
                Image(systemName: "person")
                Text("Account")
            }
            
            
        }
    }
}

struct HomeVendeur_Previews: PreviewProvider {
    static var previews: some View {
        HomeVendeur()
    }
}
