//
//  DetailProduct.swift
//  carNote
//
//  Created by youssef-mariem on 7/12/2022.
//

import SwiftUI

struct DetailProduct: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottom){
                
                VStack(alignment: .leading){
                    
                 
                    
                    Image("P5")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180, height: 160)
                        .offset(x:30, y:-100)
                        .scaledToFit()
                    
                    
                    Text("title")
                        .bold()
                        .offset(x:80, y:-90)
                       
                    
                    
                    Text("description")
                        .offset(x:0, y:-50)
                    

                    Text("prix")
                    
                }
                .padding()
                .frame(width: 300 ,height: 500 ,alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius:50)
        }
    }
}

struct DetailProduct_Previews: PreviewProvider {
    static var previews: some View {
        DetailProduct()
    }
}
