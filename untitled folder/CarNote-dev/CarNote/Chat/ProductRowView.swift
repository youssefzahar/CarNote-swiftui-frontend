//
//  ProductRowView.swift
//  carNote
//
//  Created by youssef-mariem on 12/12/2022.
//

import SwiftUI

struct ProductRowView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var product : Product
    
    var body: some View {
        HStack(spacing: 20){
            Image("P4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10){
                Text(product.title)
                    .bold()
                
                Text("\(product.prix!,format: .number)DT")
            }
             Spacer()
            
            
            
            
         /*   Button{
                cartManager.removeFromCart( product : product)
                
            }label: {
             Image(systemName: "trash")
                    .foregroundColor(Color(hue:  1.0, saturation: 0.89, brightness : 0.835))
            }
            
            */
            
            
            
            
            
            Image(systemName: "trash")
                .foregroundColor(Color(hue:  1.0, saturation: 0.89, brightness : 0.835))
                .onTapGesture {
                    //cartManager.removeFromCart(product: product)
                }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product : productList[3]).environmentObject(CartManager())    }
}
