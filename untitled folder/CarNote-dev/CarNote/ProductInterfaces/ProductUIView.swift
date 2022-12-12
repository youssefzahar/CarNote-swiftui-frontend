//
//  ProductUIView.swift
//  carNote
//
//  Created by youssef-mariem on 6/12/2022.
//

import SwiftUI

struct ProductUIView: View {
    
    @EnvironmentObject var cartManager: CartManager
  
    var product: Product
    
    var body: some View {
        
        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottom){
                Image("P4")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(product.title)
                        .bold()
                    Text("\(product.prix!,format: .number)DT")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180 , alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button{
                cartManager.addToCart( product : product)
                
            }label: {
             Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(50)
                    .padding()
            }
            
            
            
           
    
            
        }}}

struct ProductUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductUIView(product : productList[0]).environmentObject(CartManager())
    }
}
