//
//  ProductListUIView.swift
//  carNote
//
//  Created by youssef-mariem on 6/12/2022.
//

import SwiftUI

struct ProductListUIView: View {
    
        var columns = [GridItem(.adaptive(minimum: 150), spacing: 30)]
        @StateObject var  productViewModel = ProduitViewModel()
        @EnvironmentObject var cartManager : CartManager
        var body: some View {
            NavigationView{
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(0 ..< productViewModel.ListProducts.count, id:  \ .self ) {
                            index in ProductUIView(product : productViewModel.ListProducts[index])
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                /*   .navigationTitle(Text("Product Shop"))
                 .toolbar{
                 NavigationLink{
                 CartView()
                 .environmentObject(cartManager)
                 } label: {
                 CartButton(numberOfProducts: cartManager.ListProducts.count)
                 
                 }
                 }
                 }
                 .navigationViewStyle(StackNavigationViewStyle())*/
            }
            
        }
    }
        
        struct ProductListUIView_Previews: PreviewProvider {
            static var previews: some View {
                ProductListUIView().environmentObject(CartManager())
            }
        }
    
