//
//  ProductUIView2.swift
//  carNote
//
//  Created by Apple Esprit on 23/12/2022.
//

import SwiftUI

struct ProductUIView2: View {
    @State private var isActive: Bool = false
  
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
            .shadow(radius: 3)        }

    }
}

struct ProductUIView2_Previews: PreviewProvider {
    static var previews: some View {
        ProductUIView2(product : productList[0])
    }
}
