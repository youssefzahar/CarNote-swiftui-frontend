//
//  ShopView.swift
//  carNote
//
//  Created by Apple Esprit on 21/12/2022.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        TabView {
            //  ContentView()
            CarShopListView()  .tabItem{
                Image(systemName: "car")
                Text("Shop")
            }
            ProductListUIView ()  .tabItem{
                Image(systemName: "cart")
                Text("Shop")
            }
            
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
