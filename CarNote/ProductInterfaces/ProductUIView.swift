//
//  ProductUIView.swift
//  carNote
//
//  Created by youssef-mariem on 6/12/2022.
//

import SwiftUI

struct ProductUIView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @State private var isActive: Bool = false

  
    var product: Product
    
    
    

    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottom){
                AsyncImage(url: URL(string: "http://172.17.1.75:3000/uploads/"+product.image!),
                                                                       content:{ image in
                                                                image
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                                                                
                                                                
                                                                
                                                                
                                                            },placeholder: { })
                
                VStack(alignment: .leading){
                    Text(product.title)
                        .bold()
                    Text("\(product.prix!,format: .number)€")
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
        }

    }}

struct ProductUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProductUIView(product : productList[0]).environmentObject(CartManager())
    }
}
