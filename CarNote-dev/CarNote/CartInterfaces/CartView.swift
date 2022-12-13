//
//  CartView.swift
//  carNote
//
//  Created by youssef-mariem on 25/11/2022.
//

import SwiftUI
import Stripe


struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        
        ScrollView{
            if cartManager.ListProducts.count > 0 {
                ForEach(cartManager.ListProducts, id:  \.id){
                    product in
                    ProductRowView(product : product)
                }
                HStack{
                  
                    Spacer()
                    Text("\(cartManager.total).00 DT")
                        .bold()
                }
                .padding()
                
                
            } else {
                Text("Your cart is empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
